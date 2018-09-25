/*[Vertex]*/
attribute vec3 attr_Position;
attribute vec3 attr_Normal;

#if defined(USE_VERTEX_ANIMATION)
attribute vec3 attr_Position2;
attribute vec3 attr_Normal2;
#endif

attribute vec4 attr_Color;
attribute vec4 attr_TexCoord0;

#if defined(USE_TCGEN)
attribute vec4 attr_TexCoord1;
#endif

uniform vec2	u_Dimensions;

uniform vec4   u_DiffuseTexMatrix;
uniform vec4   u_DiffuseTexOffTurb;

#if defined(USE_TCGEN) || defined(USE_RGBAGEN)
uniform vec3   u_LocalViewOrigin;
#endif

#if defined(USE_TCGEN)
uniform int    u_TCGen0;
uniform vec3   u_TCGen0Vector0;
uniform vec3   u_TCGen0Vector1;
#endif

#if defined(USE_FOG)
uniform vec4   u_FogDistance;
uniform vec4   u_FogDepth;
uniform float  u_FogEyeT;
uniform vec4   u_FogColorMask;
#endif

#if defined(USE_DEFORM_VERTEXES)
uniform int    u_DeformGen;
uniform float  u_DeformParams[5];
uniform float  u_Time;
#endif

uniform mat4   u_ModelViewProjectionMatrix;
uniform vec4   u_BaseColor;
uniform vec4   u_VertColor;

#if defined(USE_RGBAGEN)
uniform int    u_ColorGen;
uniform int    u_AlphaGen;
uniform vec3   u_AmbientLight;
uniform vec3   u_DirectedLight;
uniform vec3   u_ModelLightDir;
uniform float  u_PortalRange;
#endif

#if defined(USE_VERTEX_ANIMATION)
uniform float  u_VertexLerp;
#endif

varying vec2   var_DiffuseTex;
varying vec4   var_Color;

varying vec2	var_Dimensions;

#if defined(USE_DEFORM_VERTEXES)
vec3 DeformPosition(const vec3 pos, const vec3 normal, const vec2 st)
{
	float base =      u_DeformParams[0];
	float amplitude = u_DeformParams[1];
	float phase =     u_DeformParams[2];
	float frequency = u_DeformParams[3];
	float spread =    u_DeformParams[4];

	if (u_DeformGen == DGEN_BULGE)
	{
		phase *= st.x;
	}
	else // if (u_DeformGen <= DGEN_WAVE_INVERSE_SAWTOOTH)
	{
		phase += dot(pos.xyz, vec3(spread));
	}

	float value = phase + (u_Time * frequency);
	float func;

	if (u_DeformGen == DGEN_WAVE_SIN)
	{
		func = sin(value * 2.0 * M_PI);
	}
	else if (u_DeformGen == DGEN_WAVE_SQUARE)
	{
		func = sign(fract(0.5 - value));
	}
	else if (u_DeformGen == DGEN_WAVE_TRIANGLE)
	{
		func = abs(fract(value + 0.75) - 0.5) * 4.0 - 1.0;
	}
	else if (u_DeformGen == DGEN_WAVE_SAWTOOTH)
	{
		func = fract(value);
	}
	else if (u_DeformGen == DGEN_WAVE_INVERSE_SAWTOOTH)
	{
		func = (1.0 - fract(value));
	}
	else // if (u_DeformGen == DGEN_BULGE)
	{
		func = sin(value);
	}

	return pos + normal * (base + func * amplitude);
}
#endif

#if defined(USE_TCGEN)
vec2 GenTexCoords(int TCGen, vec3 position, vec3 normal, vec3 TCGenVector0, vec3 TCGenVector1)
{
	vec2 tex = attr_TexCoord0.st;

	if (TCGen == TCGEN_LIGHTMAP)
	{
		tex = attr_TexCoord1.st;
	}
	else if (TCGen == TCGEN_ENVIRONMENT_MAPPED)
	{
		vec3 viewer = normalize(u_LocalViewOrigin - position);
		vec2 ref = reflect(viewer, normal).yz;
		tex.s = ref.x * -0.5 + 0.5;
		tex.t = ref.y *  0.5 + 0.5;
	}
	else if (TCGen == TCGEN_VECTOR)
	{
		tex = vec2(dot(position, TCGenVector0), dot(position, TCGenVector1));
	}
	
	return tex;
}
#endif

#if defined(USE_TCMOD)
vec2 ModTexCoords(vec2 st, vec3 position, vec4 texMatrix, vec4 offTurb)
{
	float amplitude = offTurb.z;
	float phase = offTurb.w * 2.0 * M_PI;
	vec2 st2;
	st2.x = st.x * texMatrix.x + (st.y * texMatrix.z + offTurb.x);
	st2.y = st.x * texMatrix.y + (st.y * texMatrix.w + offTurb.y);

	vec2 offsetPos = vec2(position.x + position.z, position.y);
	
	vec2 texOffset = sin(offsetPos * (2.0 * M_PI / 1024.0) + vec2(phase));
	
	return st2 + texOffset * amplitude;	
}
#endif

#if defined(USE_RGBAGEN)
vec4 CalcColor(vec3 position, vec3 normal)
{
	vec4 color = u_VertColor * attr_Color + u_BaseColor;
	
	if (u_ColorGen == CGEN_LIGHTING_DIFFUSE)
	{
		float incoming = clamp(dot(normal, u_ModelLightDir), 0.0, 1.0);

		color.rgb = clamp(u_DirectedLight * incoming + u_AmbientLight, 0.0, 1.0);
	}
	
	vec3 viewer = u_LocalViewOrigin - position;

	if (u_AlphaGen == AGEN_LIGHTING_SPECULAR)
	{
		vec3 lightDir = normalize(vec3(-960.0, 1980.0, 96.0) - position);
		vec3 reflected = -reflect(lightDir, normal);
		
		color.a = clamp(dot(reflected, normalize(viewer)), 0.0, 1.0);
		color.a *= color.a;
		color.a *= color.a;
	}
	else if (u_AlphaGen == AGEN_PORTAL)
	{
		color.a = clamp(length(viewer) / u_PortalRange, 0.0, 1.0);
	}
	
	return color;
}
#endif

#if defined(USE_FOG)
float CalcFog(vec3 position)
{
	float s = dot(vec4(position, 1.0), u_FogDistance) * 8.0;
	float t = dot(vec4(position, 1.0), u_FogDepth);

	float eyeOutside = float(u_FogEyeT < 0.0);
	float fogged = float(t >= eyeOutside);

	t += 1e-6;
	t *= fogged / (t - u_FogEyeT * eyeOutside);

	return s * t;
}
#endif

void main()
{
#if defined(USE_VERTEX_ANIMATION)
	vec3 position  = mix(attr_Position, attr_Position2, u_VertexLerp);
	vec3 normal    = mix(attr_Normal,   attr_Normal2,   u_VertexLerp);
#else
	vec3 position  = attr_Position;
	vec3 normal    = attr_Normal;
#endif

#if defined(USE_DEFORM_VERTEXES)
	position = DeformPosition(position, normal, attr_TexCoord0.st);
#endif

	gl_Position = u_ModelViewProjectionMatrix * vec4(position, 1.0);

#if defined(USE_TCGEN)
	vec2 tex = GenTexCoords(u_TCGen0, position, normal, u_TCGen0Vector0, u_TCGen0Vector1);
#else
	vec2 tex = attr_TexCoord0.st;
#endif

#if defined(USE_TCMOD)
	var_DiffuseTex = ModTexCoords(tex, position, u_DiffuseTexMatrix, u_DiffuseTexOffTurb);
#else
    var_DiffuseTex = tex;
#endif

#if defined(USE_RGBAGEN)
	var_Color = CalcColor(position, normal);
#else
	var_Color = u_VertColor * attr_Color + u_BaseColor;
#endif

	var_Dimensions = u_Dimensions;

#if defined(USE_FOG)
	var_Color *= vec4(1.0) - u_FogColorMask * sqrt(clamp(CalcFog(position), 0.0, 1.0));
#endif
}

/*[Fragment]*/
uniform sampler2D u_DiffuseMap;

uniform int       u_AlphaTest;

varying vec2      var_DiffuseTex;

varying vec4      var_Color;

varying vec2	var_Dimensions;

float SampleDepth(sampler2D normalMap, vec2 t)
{
	vec3 color = texture2D(u_DiffuseMap, t).rgb;

#define const_1 ( 16.0 / 255.0)
#define const_2 (255.0 / 219.0)
	vec3 color2 = ((color - const_1) * const_2);
#define const_3 ( 125.0 / 255.0)
#define const_4 (255.0 / 115.0)
		
	color = ((color - const_3) * const_4);
	
	color = clamp(color * color * (color * 5.0), 0.0, 1.0); // testing

	//vec3 orig_color = color * 2.0;
	vec3 orig_color = color + color2;
	
	orig_color = clamp(orig_color * 2.0, 0.0, 1.0); // testing

	orig_color = clamp(orig_color, 0.0, 1.0);
	float combined_color2 = orig_color.r + orig_color.g + orig_color.b;
	combined_color2 /= 4.0;

	return clamp(1.0 - combined_color2, 0.0, 1.0);
}


float RayIntersectDisplaceMap(vec2 dp, vec2 ds, sampler2D normalMap)
{
	const float MAX_SIZE = 1.0;//1.5;
	const int linearSearchSteps = 16;
	const int binarySearchSteps = 6;

	// current size of search window
	float size = MAX_SIZE / float(linearSearchSteps);

	// current depth position
	float depth = 0.0;

	// best match found (starts with last position 1.0)
	float bestDepth = MAX_SIZE;

	// search front to back for first point inside object
	for(int i = 0; i < linearSearchSteps - 1; ++i)
	{
		depth += size;
		
		float t = SampleDepth(normalMap, dp + ds * depth) * MAX_SIZE;
		
		//if(bestDepth > 0.996)		// if no depth found yet
		if(bestDepth > MAX_SIZE - (MAX_SIZE / linearSearchSteps))		// if no depth found yet
			if(depth >= t)
				bestDepth = depth;	// store best depth
	}

	depth = bestDepth;
	
	// recurse around first point (depth) for closest match
	for(int i = 0; i < binarySearchSteps; ++i)
	{
		size *= 0.5;

		float t = SampleDepth(normalMap, dp + ds * depth) * MAX_SIZE;
		
		if(depth >= t)
		{
			bestDepth = depth;
			depth -= 2.0 * size;
		}

		depth += size;
	}

	//return ((bestDepth * var_Local1.x) + (SampleDepth(normalMap, dp) - 1.0)) * 0.5;
	return bestDepth;
}

void main()
{
	//vec4 color  = texture2D(u_DiffuseMap, var_DiffuseTex);

	vec2 texCoords = var_DiffuseTex;
	
	vec2 offsetDir = vec2(1.0 / var_Dimensions.x, 1.0 / var_Dimensions.y);

	texCoords += offsetDir.xy * RayIntersectDisplaceMap(texCoords, offsetDir.xy, u_DiffuseMap);

	vec4 color = texture2D(u_DiffuseMap, texCoords);

	//vec4 color  = texture2D(u_DiffuseMap, var_DiffuseTex);
	
	float alpha = color.a * var_Color.a;
	if (u_AlphaTest == 1)
	{
		if (alpha == 0.0)
			discard;
	}
	else if (u_AlphaTest == 2)
	{
		if (alpha >= 0.5)
			discard;
	}
	else if (u_AlphaTest == 3)
	{
		if (alpha < 0.5)
			discard;
	}
	
	gl_FragColor.rgb = color.rgb * var_Color.rgb;
	gl_FragColor.a = alpha;
}
