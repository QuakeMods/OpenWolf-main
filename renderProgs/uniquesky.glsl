/*[Vertex]*/
uniform mat4	u_ModelViewProjectionMatrix;
uniform mat4	u_ModelMatrix;
attribute vec4	attr_Position;
attribute vec3	attr_Normal;

attribute vec2	attr_TexCoord0;
varying vec2	texCoord1;

uniform vec2	u_Dimensions;
varying vec2	var_Dimensions;

uniform vec3	u_ViewOrigin;
varying vec3	viewPos;
varying vec3	viewAngles;

uniform float	u_Time;
varying float	time;

uniform int		u_DeformGen;
uniform vec4	u_DeformWave;	// [base amplitude phase freq]
uniform vec3	u_DeformBulge;	// [width height speed]
uniform float	u_DeformSpread;

float triangle(float x)
{
	return max(1.0 - abs(x), 0);
}

float sawtooth(float x)
{
	return x - floor(x);
}

vec4 DeformPosition(const vec4 pos, const vec3 normal, const vec2 st)
{
	vec4 deformed = pos;

	/*
		define	WAVEVALUE( table, base, amplitude, phase, freq ) \
			((base) + table[ Q_ftol( ( ( (phase) + backEnd.refdef.floatTime * (freq) ) * FUNCTABLE_SIZE ) ) & FUNCTABLE_MASK ] * (amplitude))
	*/

	if(u_DeformGen == DGEN_WAVE_SIN)
	{
		float off = (pos.x + pos.y + pos.z) * u_DeformSpread;
		float scale = u_DeformWave.x  + sin(off + u_DeformWave.z + (u_Time * u_DeformWave.w)) * u_DeformWave.y;
		vec3 offset = normal * scale;

		deformed.xyz += offset;
	}

	if(u_DeformGen == DGEN_WAVE_SQUARE)
	{
		float off = (pos.x + pos.y + pos.z) * u_DeformSpread;
		float scale = u_DeformWave.x  + sign(sin(off + u_DeformWave.z + (u_Time * u_DeformWave.w))) * u_DeformWave.y;
		vec3 offset = normal * scale;

		deformed.xyz += offset;
	}

	if(u_DeformGen == DGEN_WAVE_TRIANGLE)
	{
		float off = (pos.x + pos.y + pos.z) * u_DeformSpread;
		float scale = u_DeformWave.x  + triangle(off + u_DeformWave.z + (u_Time * u_DeformWave.w)) * u_DeformWave.y;
		vec3 offset = normal * scale;

		deformed.xyz += offset;
	}

	if(u_DeformGen == DGEN_WAVE_SAWTOOTH)
	{
		float off = (pos.x + pos.y + pos.z) * u_DeformSpread;
		float scale = u_DeformWave.x  + sawtooth(off + u_DeformWave.z + (u_Time * u_DeformWave.w)) * u_DeformWave.y;
		vec3 offset = normal * scale;

		deformed.xyz += offset;
	}

	if(u_DeformGen == DGEN_WAVE_INVERSE_SAWTOOTH)
	{
		float off = (pos.x + pos.y + pos.z) * u_DeformSpread;
		float scale = u_DeformWave.x + (1.0 - sawtooth(off + u_DeformWave.z + (u_Time * u_DeformWave.w))) * u_DeformWave.y;
		vec3 offset = normal * scale;

		deformed.xyz += offset;
	}

	if(u_DeformGen == DGEN_BULGE)
	{
		float bulgeWidth = u_DeformBulge.x;
		float bulgeHeight = u_DeformBulge.y;
		float bulgeSpeed = u_DeformBulge.z;

		float now = u_Time * bulgeSpeed;

		float off = (M_PI * 0.25) * st.x * bulgeWidth + now;
		float scale = sin(off) * bulgeHeight;
		vec3 offset = normal * scale;

		deformed.xyz += offset;
	}

	return deformed;
}

void main()
{
	vec4 position = DeformPosition(attr_Position, attr_Normal, attr_TexCoord0.st);
	//gl_Position = u_ModelViewProjectionMatrix * vec4(attr_Position, 1.0);

	// transform vertex position into homogenous clip-space
	gl_Position = u_ModelViewProjectionMatrix * position;

	// transform position into world space
	viewPos = (u_ModelMatrix * position).xyz;

	// compute view direction in world space
	viewAngles = normalize(u_ViewOrigin - viewPos);

	texCoord1 = attr_TexCoord0.st;
	var_Dimensions = u_Dimensions;

	time = u_Time;
}


/*[Fragment]*/
varying vec2	texCoord1;
varying vec2	var_Dimensions;
varying float	time;
varying vec3	viewPos;
varying vec3	viewAngles;
vec2 resolution = var_Dimensions;

vec3 sunLight  = normalize( vec3(  0.35, 0.17,  0.3 ) );
vec3 sunColour = vec3(1.0, .5, .24);
float gTime;
float cloudy;

#define cloudLower 2000.0
#define cloudUpper 2800.0
//#define TEXTURE_NOISE


//--------------------------------------------------------------------------
float Hash( float n )
{
	return fract(sin(n)*43758.5453);
}

//--------------------------------------------------------------------------
float Noise( in vec2 x )
{
    vec2 p = floor(x);
    vec2 f = fract(x);
    f = f*f*(3.0-2.0*f);
    float n = p.x + p.y*57.0;
    float res = mix(mix( Hash(n+  0.0), Hash(n+  1.0),f.x),
                    mix( Hash(n+ 57.0), Hash(n+ 58.0),f.x),f.y);
    return res;
}
//--------------------------------------------------------------------------
float Hash(in vec3 p)
{
    return fract(sin(dot(p,vec3(37.1,61.7, 12.4)))*3758.5453123);
}

//--------------------------------------------------------------------------
#ifdef TEXTURE_NOISE
float Noise( in vec3 x )
{
    vec3 p = floor(x);
    vec3 f = fract(x);
	f = f*f*(3.0-2.0*f);
	
	vec2 uv = (p.xy+vec2(37.0,17.0)*p.z) + f.xy;
	vec2 rg = texture2D( iChannel0, (uv+ 0.5)/256.0, -100.0 ).yx;
	return mix( rg.x, rg.y, f.z );
}
#else
float Noise(in vec3 p)
{
    vec3 i = floor(p);
	vec3 f = fract(p); 
	f *= f * (3.0-2.0*f);

    return mix(
		mix(mix(Hash(i + vec3(0.,0.,0.)), Hash(i + vec3(1.,0.,0.)),f.x),
			mix(Hash(i + vec3(0.,1.,0.)), Hash(i + vec3(1.,1.,0.)),f.x),
			f.y),
		mix(mix(Hash(i + vec3(0.,0.,1.)), Hash(i + vec3(1.,0.,1.)),f.x),
			mix(Hash(i + vec3(0.,1.,1.)), Hash(i + vec3(1.,1.,1.)),f.x),
			f.y),
		f.z);
}
#endif

//--------------------------------------------------------------------------
float FBM( vec3 p )
{
	p.xz *= .5;
    float f;
    f  = 0.5000   * Noise(p); p =  p * 3.52;
    f += 0.2500   * Noise(p); p =  p * 3.53;
    f += 0.1250   * Noise(p); p =  p * 3.51;
    f += 0.0625   * Noise(p); p =  p * 3.515;
	f += 0.03125  * Noise(p); p =  p * 3.52;
	f += 0.015625 * Noise(p);
    return f;
}

//--------------------------------------------------------------------------
float SeaFBM( vec2 p )
{
    float f;
	f = sin(sin(p.x *.22) + cos(p.y *.24)+p.x*.05+p.y*.03);
    f += 0.5000 * Noise(p); p =  p * 2.12;
    f += 0.2500 * Noise(p); p =  p * 2.27;
    f += 0.1250 * Noise(p); p =  p * 2.13;
    f += 0.0625 * Noise(p); p =  p * 2.03;

	return f;
}

//--------------------------------------------------------------------------
float Map(vec3 p)
{
	p.y -= gTime *.05 - 3.5;
	float h = FBM(p);
	return h-cloudy-.45;
}

//--------------------------------------------------------------------------
float SeaMap(in vec2 pos)
{
	pos *= .008;
	return SeaFBM(pos) * 15.0;
}

//--------------------------------------------------------------------------
vec3 SeaNormal( in vec3 pos, in float d)
{
	float p = .01 * d * d / resolution.y;
	vec3 nor  	= vec3(0.0,		    SeaMap(pos.xz), 0.0);
	vec3 v2		= nor-vec3(p,		SeaMap(pos.xz+vec2(p,0.0)), 0.0);
	vec3 v3		= nor-vec3(0.0,		SeaMap(pos.xz+vec2(0.0,-p)), -p);
	nor = cross(v2, v3);
	return normalize(nor);
}

//--------------------------------------------------------------------------
// Grab all sky information for a given ray from camera
vec3 GetSky(in vec3 pos,in vec3 rd)
{
	float sunAmount = max( dot( rd, sunLight), 0.0 );
	// Do the blue and sun...	
	vec3  sky = vec3(.2, .5, .75);
	sky = sky + sunColour * min(pow(sunAmount, 1000.0) * 2.0, 1.0);
	sky = sky + sunColour * min(pow(sunAmount, 10.0) * .85, 1.0);
	
	// Find the start and end of the cloud layer...
	float beg = ((cloudLower-pos.y)/rd.y);
	float end = ((cloudUpper-pos.y)/rd.y);
	// Start position...
	vec3 p = vec3(pos.x + rd.x * beg, cloudLower, pos.z + rd.z * beg);

	// Trace clouds through that layer...
	float d = 0.0;
	float add = (end-beg) / 40.0;
	vec4 sum = vec4(0.0);
	// Horizon fog is just thicker clouds...
	vec4 col = vec4(0, 0, 0, pow(1.0-rd.y,8.) * .1);
	for (int i = 0; i < 40; i++)
	{
		if (col.a >= 1.0) continue;
		vec3 pos = p + rd * d;
		float h = Map(pos * .001);
		col.a += max(-h, 0.0) * .09; 
		col.rgb = mix(vec3((pos.y-cloudLower)/((cloudUpper-cloudLower) * .8)) * col.a, sunColour, max(.5-col.a, 0.0) * .05);
		sum = sum + col*(1.0 - sum.a);
		d += add;
	}
	sum.xyz += min((1.-sum.a) * pow(sunAmount, 3.0), 1.0);
	sky = mix(sky, sum.xyz, sum.a);

	return clamp(sky, 0.0, 1.0);
}

//--------------------------------------------------------------------------
vec3 GetSea(in vec3 pos,in vec3 rd)
{
	vec3 sea;
	float d = -pos.y/rd.y;
	vec3 p = vec3(pos.x + rd.x * d, 0.0, pos.z + rd.z * d);
	
	float dis = length(p-pos);
	vec3 nor = SeaNormal(p, dis);

	vec3 ref = reflect(rd, nor);
	sea = GetSky(p, ref);
	
	sea = mix(sea*.6, vec3(.15, .3, .4), .2);
	
	float glit = max(dot(ref, sunLight), 0.0);
	sea += sunColour * pow(glit, 220.0) * max(-cloudy*100.0, 0.0);
	
	return sea;
}

//--------------------------------------------------------------------------
vec3 CameraPath( float t )
{
	//t = time + t;
    vec2 p = vec2(4000.0 * sin(.16*t), 4000.0 * cos(.155*t) );
	return vec3(p.x+5.0,  0.0, -94.0+p.y);
} 

//--------------------------------------------------------------------------
void main(void)
{
#if 0
	gTime = time*.65 + 70. + 0.07*length(gl_FragCoord)/length(resolution);
	cloudy = cos(gTime * .27+.15) * .2;
	
    vec2 xy = gl_FragCoord.xy / resolution.xy;
	vec2 uv = (-1.0 + 2.0 * xy) * vec2(resolution.x/resolution.y,1.0);
	
	//vec3 cameraPos	   = vec3(1.0, 1.0, 1.0);
	//vec3 cameraPos = CameraPath(gTime);
	vec3 cameraPos = viewAngles.zxy;
	//vec3 camTar	   = CameraPath(gTime + 1.0);
	vec3 camTar	   = CameraPath(gTime + 1.0);
	//camTar.z = viewAngles.z;
	//vec3 camTar	   = vec3(0.0, 0.0, 0.0);
	//camTar.y = cameraPos.y = sin(gTime) * 200.0 + 300.0;
	camTar.y = sin(gTime) * 200.0 + 300.0;
	//camTar.x = cameraPos.x = sin(gTime) * 200.0 + 300.0;
	//camTar.z = cameraPos.z = sin(gTime) * 200.0 + 300.0;
	//camTar.y = cameraPos.y = sin(viewAngles.y*gTime) * 200.0 + 300.0;
	camTar.y += 300.0;
	
	//float roll = .1 * sin(gTime * .25);
	float roll = 0.0;
	//vec3 cw = normalize(camTar-cameraPos);
	vec3 cw = normalize(viewAngles);
	vec3 cp = vec3(sin(roll), cos(roll),0.0);
	vec3 cu = cross(cw,cp);
	vec3 cv = cross(cu,cw);
	vec3 dir = normalize(uv.x*cu + uv.y*cv + 1.3*cw);
	mat3 camMat = mat3(cu, cv, cw);

	vec3 col;
	float distance = 1e20;
	float type = 0.0;

	//if (dir.y > 0.0)
	//{
		col = GetSky(cameraPos, dir);
	//}else
	//{
	//	col = GetSea(cameraPos, dir);
	//}

	// Don't gamma too much to keep the moody look...
	col = pow(col, vec3(.7));
	gl_FragColor=vec4(col, 1.0);
#endif
	gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
}
