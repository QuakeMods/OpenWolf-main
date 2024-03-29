/*[Vertex]*/
attribute vec3 attr_Position;
attribute vec4 attr_TexCoord0;

uniform mat4   u_ModelViewProjectionMatrix;

uniform vec2	u_Dimensions;
uniform vec4	u_ViewInfo; // zfar / znear, zfar

uniform vec4	u_Local0; // PASS_NUM, 0, 0, 0

varying vec2   var_TexCoords;
varying vec2   var_Dimensions;
varying vec4   var_ViewInfo; // zmin, zmax, zmax / zmin
varying vec4   var_Local0; // PASS_NUM, 0, 0, 0

void main()
{
	gl_Position = u_ModelViewProjectionMatrix * vec4(attr_Position, 1.0);
	var_TexCoords = attr_TexCoord0.st;
	var_Dimensions = u_Dimensions.st;
	var_ViewInfo = u_ViewInfo;
	var_Local0 = u_Local0;
}

/*[Fragment]*/
uniform sampler2D u_TextureMap;
uniform sampler2D u_ScreenDepthMap;
uniform sampler2D u_NormalMap; // actually saturation map image
uniform sampler2D u_GlowMap; // actually saturation map image
uniform sampler2D u_RandomMap;

varying vec2		var_TexCoords;
varying vec2		var_Dimensions;
varying vec4		var_ViewInfo; // zmin, zmax, zmax / zmin
varying vec4		var_Local0; // MODE, NUM_SAMPLES, 0, 0

/*
*CSSGI shader (Coherent Screen Space Global Illumination)
*This shader requires a depth pass and a normal map pass.
*/

float MODE = var_Local0.x;

#define PI  3.14159265

#define USE_RANDOMMAP

//#define USE_GLOWMAP
#define USE_DEPTHMAP

#ifdef USE_DEPTHMAP
const float depthMult = 255.0;
#endif //USE_DEPTHMAP

float ratex = (1.0/var_Dimensions.x);
float ratey = (1.0/var_Dimensions.y);

vec2 offset1 = vec2(0.0, ratey);
vec2 offset2 = vec2(ratex, 0.0);

#ifdef USE_DEPTHMAP
vec3 normal_from_depth(float depth, vec2 texcoords) {
  float depth1 = texture2D(u_ScreenDepthMap, texcoords + offset1).r * depthMult;
  float depth2 = texture2D(u_ScreenDepthMap, texcoords + offset2).r * depthMult;
  
  vec3 p1 = vec3(offset1, depth1 - depth);
  vec3 p2 = vec3(offset2, depth2 - depth);
  
  vec3 normal = cross(p1, p2);
  normal.z = -normal.z;
  
  return normalize(normal);
}
#endif //USE_DEPTHMAP

vec3 SampleNormals(sampler2D normalMap, in vec2 coord)  
{
#ifdef USE_DEPTHMAP
	 float depth = texture2D(u_ScreenDepthMap, coord/*var_TexCoords*/).r * depthMult;
	 return normal_from_depth(depth, coord);
#else //!USE_DEPTHMAP
	 return texture2D(u_NormalMap, coord).rgb;
#endif //USE_DEPTHMAP
}

#ifdef USE_RANDOMMAP
float rand2(vec2 coord)
{
	return texture2D(u_RandomMap, coord*vec2(var_Dimensions)*vec2(1./256.)).r;
}

float rand(vec2 co){
	return texture2D(u_RandomMap, co*vec2(var_Dimensions)*vec2(1./256.)).b;
}
#else //!USE_RANDOMMAP
float rand2(vec2 coord) //generating noise/pattern texture for dithering
{
	float noise = ((fract(1.0-coord.s*(var_Dimensions.x/2.0))*0.25)+(fract(coord.t*(var_Dimensions.y/2.0))*0.75))*2.0-1.0;
	return noise;
}

//noise producing function to eliminate banding (got it from someone else´s shader):
float rand(vec2 co){
	return 0.5+(fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453))*0.5;
}
#endif //USE_RANDOMMAP

vec3 CalculateFlare ( vec3 flare_color, vec3 final_color )
{
	float bt = (flare_color.r + flare_color.g + flare_color.b) / 3.0;

	if (bt > 0.666) 
		bt *= 0.666; // Bright lights get dulled... (eg: white)
	else if (bt < 0.333) 
		bt *= 1.8; // Dull lights get amplified... (eg: blue)
	else 
		bt *= 1.1; // Mid range lights get amplified slightly... (eg: yellow)

	vec3 flare_color2 = clamp(flare_color * bt * 8.0, 0.0, 1.0);
	vec3 add_flare = clamp(final_color * (flare_color2 * (1.25 - final_color) * 2.5), 0.0, 1.0);

	//vec3 flare_color2 = clamp(flare_color * bt * 8.0, 0.0, 1.0);
	//vec3 add_flare = clamp(final_color * (flare_color2 * (1.5 - final_color) * 2.5), 0.0, 1.0);

#define const_1 ( 12.0 / 255.0)
#define const_2 (255.0 / 219.0)
	add_flare = ((clamp(add_flare - const_1, 0.0, 1.0)) * const_2);

	return add_flare * 0.7;
}

void main()
{   
#ifdef FAST_SSGI
	const float NUM_SAMPLES = 2.0;
#else //!FAST_SSGI
	const float NUM_SAMPLES = 4.0;
#endif //FAST_SSGI

	if (MODE >= 2.0)
	{// Full modes...
		//calculate sampling rates:
		//initialize occlusion sum and gi color:
		float sum = 0.0;
		vec3 fcolor = vec3(0,0,0);

		//far and near clip planes:
		float zFar = 1.0;
		float zNear = var_ViewInfo.x / var_Dimensions.x;

		//get depth at current pixel:
		float prof = texture2D(u_ScreenDepthMap, var_TexCoords.st).x;
		//scale sample number with depth:
		float samples = round(NUM_SAMPLES/(0.5+prof));
		prof = zFar * zNear / (prof * (zFar - zNear) - zFar);  //linearize z sample

		//obtain normal and color at current pixel:
		vec3 norm = normalize(vec3(SampleNormals(u_TextureMap,var_TexCoords.st).xyz)*2.0-vec3(1.0));
		vec3 dcolor1 = texture2D(u_TextureMap, var_TexCoords.st).xyz;

		float hf = samples/2;

		//calculate kernel steps:
		float incx = ratex*30.0;//gi radius
		float incy = ratey*30.0;

		float incx2 = ratex*8;//ao radius
		float incy2 = ratey*8;

		//do the actual calculations:
		for(float i=-hf; i < hf; i+=1.0){
			for(float j=-hf; j < hf; j+=1.0){

				if (i != 0 || j!= 0) {

					vec2 coords = vec2(i*incx,j*incy)/prof;
					vec2 coords2 = vec2(i*incx2,j*incy2)/prof;

					float prof2 = texture2D(u_ScreenDepthMap,var_TexCoords.st+coords*rand(var_TexCoords)).x;
					prof2 = zFar * zNear / (prof2 * (zFar - zNear) - zFar);  //linearize z sample

					float prof2g = texture2D(u_ScreenDepthMap,var_TexCoords.st+coords2*rand(var_TexCoords)).x;
					prof2g = zFar * zNear / (prof2g * (zFar - zNear) - zFar);  //linearize z sample

					if (MODE == 2.0 || MODE == 4.0)
					{//OCCLUSION:
						vec3 norm2g = normalize(vec3(SampleNormals(u_TextureMap,var_TexCoords.st+coords2*rand(var_TexCoords)).xyz)*2.0-vec3(1.0)); 

						//calculate approximate pixel distance:
						vec3 dist2 = vec3(coords2,prof-prof2g);

						//calculate normal and sampling direction coherence:
						float coherence2 = dot(normalize(-coords2),normalize(vec2(norm2g.xy)));

						//if there is coherence, calculate occlusion:
						if (coherence2 > 0){
							float pformfactor2 = 0.5*((1.0-dot(norm,norm2g)))/(3.1416*pow(abs(length(dist2*2)),2.0)+0.5);//el 4: depthscale
							sum += clamp(pformfactor2*0.2,0.0,1.0);//ao intensity; 
						}
					}

					if (MODE >= 3.0)
					{//COLOR BLEEDING:
//COLOR BLEEDING:
#ifdef USE_GLOWMAP
						vec3 dcolor2 = texture2D(u_GlowMap, var_TexCoords.st+coords*rand(var_TexCoords)).xyz;
#else //USE_GLOWMAP
						vec3 dcolor2 = texture2D(u_TextureMap, var_TexCoords.st+coords*rand(var_TexCoords)).xyz;
				
						if (length(dcolor2)>0.3)//color threshold
#endif //USE_GLOWMAP
						{
							vec3 norm2 = normalize(vec3(SampleNormals(u_TextureMap,var_TexCoords.st+coords*rand(var_TexCoords)).xyz)*2.0-vec3(1.0)); 

							//calculate approximate pixel distance:
							vec3 dist = vec3(coords,abs(prof-prof2));

							//calculate normal and sampling direction coherence:
							float coherence = dot(normalize(-coords),normalize(vec2(norm2.xy)));

							//if there is coherence, calculate bleeding:
							if (coherence > 0.0){
								float pformfactor = ((1.0-dot(norm,norm2)))/(3.1416*pow(abs(length(dist*2.0)),2.0)+0.5);//el 4: depthscale
								fcolor += dcolor2*(clamp(pformfactor,0.0,1.0));
							}
						}
					}
				}
			}
		}

		if (MODE >= 4.0)
		{// COLOR BLEED & OCCLUSION
			float MODIFIER = 1.0 - clamp( length(dcolor1.rgb) / 1.5, 0.0, 1.0 );
			vec3 bleeding = (fcolor/samples)*0.5;
			float occlusion = 1.0-((sum/samples) * 0.75 * MODIFIER);

#ifdef USE_GLOWMAP
			bleeding *= clamp(length(dcolor1) * 0.333 * MODIFIER, 0.0, 1.0);
			vec3 final_color = vec3((dcolor1 * occlusion) + (bleeding));// * 1.25;
#else //!USE_GLOWMAP
			bleeding *= 0.5;
			vec3 final_color = vec3((dcolor1 * occlusion) + (dcolor1 * bleeding));// * 1.25;
#endif //USE_GLOWMAP

			// UQ1: Let's add some of the flare color as well... Just to boost colors/glows...
			vec3 flare_color = clamp(texture2D(u_NormalMap, var_TexCoords.st).rgb, 0.0, 1.0);
			vec3 add_flare = CalculateFlare(flare_color, final_color);
			final_color = clamp((final_color + final_color + final_color + max(add_flare, final_color)) / 4.0, 0.0, 1.0);

			gl_FragColor = vec4(final_color,1.0);
		}
		else if (MODE >= 3.0)
		{// COLOR BLEED ONLY
#ifdef USE_GLOWMAP
			float MODIFIER = 1.0 - clamp( length(dcolor1.rgb) / 1.5, 0.0, 1.0 );
#endif //USE_GLOWMAP
			vec3 bleeding = (fcolor/samples)*0.5;

			// UQ1: Adjust bleed ammount...
#ifdef USE_GLOWMAP
			bleeding *= clamp(length(dcolor1) * 0.333 * MODIFIER, 0.0, 1.0);
			vec3 final_color = vec3((dcolor1) + (bleeding));// * 1.25;
#else //!USE_GLOWMAP
			bleeding *= 0.5;
			vec3 final_color = vec3((dcolor1) + (dcolor1 * bleeding));// * 1.25;
#endif //USE_GLOWMAP
			// UQ1: Let's add some of the flare color as well... Just to boost colors/glows...
			vec3 flare_color = clamp(texture2D(u_NormalMap, var_TexCoords.st).rgb, 0.0, 1.0);
			vec3 add_flare = CalculateFlare(flare_color, final_color);
			//final_color = clamp(((final_color * 5.0) + max(add_flare, final_color)) / 6.0, 0.0, 1.0);
			final_color = clamp((final_color + final_color + final_color + max(add_flare, final_color)) / 4.0, 0.0, 1.0);

			gl_FragColor = vec4(final_color,1.0);
		}
		else // MODE == 2.0
		{// OCCLUSION ONLY
			float MODIFIER = 1.0 - clamp( length(dcolor1.rgb) / 1.5, 0.0, 1.0 );
			float occlusion = 1.0-((sum/samples) * 0.75 * MODIFIER);
			vec3 final_color = vec3(dcolor1* occlusion);// * 1.25;

			// UQ1: Let's add some of the flare color as well... Just to boost colors/glows...
			vec3 flare_color = clamp(texture2D(u_NormalMap, var_TexCoords.st).rgb, 0.0, 1.0);
			vec3 add_flare = CalculateFlare(flare_color, final_color);
			//final_color = clamp(((final_color * 5.0) + max(add_flare, final_color)) / 6.0, 0.0, 1.0);
			final_color = clamp((final_color + final_color + final_color + max(add_flare, final_color)) / 4.0, 0.0, 1.0);

			gl_FragColor = vec4(final_color,1.0);
		}
	}
	else
	{// Fast (just color bleed) mode...
		vec3 final_color = texture2D(u_TextureMap, var_TexCoords.st).xyz;// * 1.25;
		
		// UQ1: Let's add some of the flare color as well... Just to boost colors/glows...
		vec3 flare_color = clamp(texture2D(u_NormalMap, var_TexCoords.st).rgb, 0.0, 1.0);
		vec3 add_flare = CalculateFlare(flare_color, final_color);
		//final_color = clamp(((final_color * 5.0) + max(add_flare, final_color)) / 6.0, 0.0, 1.0);
		final_color = clamp((final_color + final_color + final_color + max(add_flare, final_color)) / 4.0, 0.0, 1.0);

		gl_FragColor = vec4(final_color,1.0);
	}
}
