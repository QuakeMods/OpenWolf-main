/*[Vertex]*/
attribute vec3	attr_Position;
attribute vec4	attr_TexCoord0;

uniform mat4	u_ModelViewProjectionMatrix;

uniform vec2	u_Dimensions;

varying vec2	var_TexCoords;
varying vec3	var_Position;
varying vec2	var_Dimensions;

void main()
{
	gl_Position = u_ModelViewProjectionMatrix * vec4(attr_Position, 1.0);
	var_Position = gl_Position.xyz;
	var_TexCoords = attr_TexCoord0.st;
	var_Dimensions = u_Dimensions.st;
}

/*[Fragment]*/
uniform sampler2D u_DiffuseMap;
//uniform sampler2D lensDirtTex; // UQ1: FIXME - Add one with Warzone assests later...

varying vec2	var_TexCoords;
varying vec3	var_Position;
varying vec2	var_Dimensions;

vec2 dist2(vec3 p)
{
	const vec2 f1 = vec2(1048576.0, 0.0);
	const vec2 f2 = vec2(1048576.0, 0.0);
	return vec2(min(f1.x,f2.x),f1.y+f2.y);
}

float dist(vec3 p)
{
	return dist2(p).x;
}

float amb_occ(vec3 p)
{
	float acc=0.0;
	#define ambocce 1.9

	acc+=dist(p+vec3(-ambocce,-ambocce,-ambocce));
	acc+=dist(p+vec3(-ambocce,-ambocce,+ambocce));
	acc+=dist(p+vec3(-ambocce,+ambocce,-ambocce));
	acc+=dist(p+vec3(-ambocce,+ambocce,+ambocce));
	acc+=dist(p+vec3(+ambocce,-ambocce,-ambocce));
	acc+=dist(p+vec3(+ambocce,-ambocce,+ambocce));
	acc+=dist(p+vec3(+ambocce,+ambocce,-ambocce));
	acc+=dist(p+vec3(+ambocce,+ambocce,+ambocce));
	return 0.5+acc /(16.0*ambocce);
}


#define MAX_GHOSTS 4
#define GHOST_DISPERSAL (0.7)
#define HALO_WIDTH 0.4
#define CHROMATIC_DISTORTION 4.0
#define ENABLE_CHROMATIC_DISTORTION 1
#define ENABLE_HALO 1

float hash(vec2 p) {
   float h = dot(p,vec2(127.1,311.7));
   return -1.0 + 2.0*fract(sin(h)*43758.5453123);
}

float noise(in vec2 p) {
   vec2 i = floor(p);
   vec2 f = fract(p);
   vec2 u = f*f*(3.0-2.0*f);

   return mix(mix(hash(i + vec2(0.0,0.0)), 
                  hash(i + vec2(1.0,0.0)), u.x),
              mix(hash(i + vec2(0.0,1.0)), 
                  hash(i + vec2(1.0,1.0)), u.x), u.y);
}

float fbm(vec2 p) {
   float f = 0.0;
   f += 0.5000 * noise(p); p *= 2.02;
   f += 0.2500 * noise(p); p *= 2.03;
   f += 0.1250 * noise(p); p *= 2.01;
   f += 0.0625 * noise(p); p *= 2.04;
   f /= 0.9375;
   return f;
}

vec3 pattern(vec2 uv) {
   vec2 p = -1.0 + 2.0 * uv;
   float p2 = dot(p,p);
   float f = fbm(vec2(15.0*p2)) / 2.0;
   float r = 0.2 + 0.6 * sin(12.5*length(uv - vec2(0.5)));
   float g = 0.2 + 0.6 * sin(20.5*length(uv - vec2(0.5)));
   float b = 0.2 + 0.6 * sin(17.2*length(uv - vec2(0.5)));
   return (1.0-f) * vec3(r,g,b);
}

vec3 textureDistorted(
	in sampler2D tex,
	in vec2 texcoord,
	in vec2 direction, // direction of distortion
	in vec3 distortion) // per-channel distortion factor  
{
#if ENABLE_CHROMATIC_DISTORTION
	return vec3(
		texture(tex, texcoord + direction * distortion.r).r,
		texture(tex, texcoord + direction * distortion.g).g,
		texture(tex, texcoord + direction * distortion.b).b) * 0.03;
#else
	return texture(tex, texcoord).rgb * 0.03;
#endif
}

void main()
{
	//vec3 fColor;
	vec3 fColor = texture(u_DiffuseMap, var_TexCoords).rgb;

	vec2 texcoord = -var_TexCoords + vec2(1.0);

	vec2 imgSize = vec2(textureSize(u_DiffuseMap, 0));

	vec2 ghostVec = (vec2(0.5) - texcoord) * GHOST_DISPERSAL;

	vec2 texelSize = 1.0 / vec2(var_Dimensions);

	vec3 distortion = vec3(
		-texelSize.x * CHROMATIC_DISTORTION, 
		0.0, 
		texelSize.x * CHROMATIC_DISTORTION);

	float lenOfHalf = length(vec2(0.5));

	vec2 direction = normalize(ghostVec);

	vec3 result = vec3(0.0);

	// sample ghosts:  
	for(int i = 0; i < MAX_GHOSTS; ++i) 
	{ 
		vec2 offset = fract(texcoord + ghostVec * float(i));

		float weight = length(vec2(0.5) - offset) / lenOfHalf;
		weight = pow(1.0 - weight, 10.0);

		result += textureDistorted(u_DiffuseMap, offset, direction, distortion) * weight;
	}

	// sample halo
#if ENABLE_HALO
	vec2 haloVec = normalize(ghostVec) * HALO_WIDTH;
	float weight = 
		length(vec2(0.5) - fract(texcoord + haloVec)) / lenOfHalf;
	weight = pow(1.0 - weight, 20.0);
	result += textureDistorted(u_DiffuseMap, texcoord + haloVec, direction, distortion) 
		* weight;
#endif

	// lens dirt
	//result *= texture(lensDirtTex, var_TexCoords).rgb; // UQ1: FIXME - Add one with Warzone assests later...
	//result *= pattern(var_TexCoords); // UQ1: Crappy backup method... Disable this and enable above when we have the image...
	result.r *= sin(var_TexCoords.x);
	result.g *= var_TexCoords.y;
	result.b *= cos(var_TexCoords.x);

	// Write
	//fColor -= clamp(amb_occ(var_Position.xyz), 0.0, 1.0) * 0.02; // UQ1: Just testing this. Not related to lensflare at all...
	fColor += result;
	gl_FragColor = vec4(fColor.rgb, 1.0);
}

