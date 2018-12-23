/*[Vertex]*/
attribute vec2 attr_TexCoord0;
attribute vec2 attr_TexCoord1;

attribute vec4 attr_Color;

attribute vec3 attr_Position;
attribute vec3 attr_Normal;
attribute vec4 attr_Tangent;

#if defined(USE_VERTEX_ANIMATION)
attribute vec3 attr_Position2;
attribute vec3 attr_Normal2;
attribute vec4 attr_Tangent2;
#elif defined(USE_SKELETAL_ANIMATION)
attribute vec4 attr_BoneIndexes;
attribute vec4 attr_BoneWeights;
#endif

varying vec3	var_Position;
varying vec3	var_Normal;
varying vec4	var_Color;

uniform vec4	u_Local1; // parallaxScale, haveSpecular, specularScale, materialType
uniform vec4	u_Local2; // ExtinctionCoefficient
uniform vec4	u_Local3; // RimScalar, MaterialThickness, subSpecPower, cubemapScale
uniform vec4	u_Local4; // haveNormalMap, isMetalic, hasRealSubsurfaceMap, sway
uniform vec4	u_Local5; // hasRealOverlayMap, overlaySway, blinnPhong, hasSteepMap
uniform vec4	u_Local6; // useSunLightSpecular
uniform vec4	u_Local9;

uniform vec3   u_ViewOrigin;

#if defined(USE_TCGEN)
uniform int    u_TCGen0;
uniform vec3   u_TCGen0Vector0;
uniform vec3   u_TCGen0Vector1;
uniform vec3   u_LocalViewOrigin;
#endif

#if defined(USE_TCMOD)
uniform vec4   u_DiffuseTexMatrix;
uniform vec4   u_DiffuseTexOffTurb;
#endif

uniform mat4   u_ModelViewProjectionMatrix;
uniform mat4	u_ViewProjectionMatrix;
uniform mat4   u_ModelMatrix;
uniform mat4	u_NormalMatrix;

#if defined(USE_VERTEX_ANIMATION)
uniform float  u_VertexLerp;
#elif defined(USE_SKELETAL_ANIMATION)
uniform mat4   u_BoneMatrices[20];
#endif

uniform vec2	u_textureScale;

varying vec2   var_TexCoords;

#if defined(USE_TCGEN)
vec2 GenTexCoords(int TCGen, vec3 position, vec3 normal, vec3 TCGenVector0, vec3 TCGenVector1)
{
	vec2 tex = attr_TexCoord0.st;

	if (TCGen >= TCGEN_LIGHTMAP && TCGen <= TCGEN_LIGHTMAP3)
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
#endif //defined(USE_TCGEN)

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
#endif //defined(USE_TCMOD)

void main()
{
#if defined(USE_VERTEX_ANIMATION)

	vec3 position  = mix(attr_Position,    attr_Position2,    u_VertexLerp);
#if defined(USE_TCGEN)
	vec3 normal    = mix(attr_Normal,      attr_Normal2,      u_VertexLerp) * 2.0 - 1.0;;
#endif //defined(USE_TCGEN)

#elif defined(USE_SKELETAL_ANIMATION)

	vec4 position4 = vec4(0.0);
	vec4 normal4 = vec4(0.0);
	vec4 originalPosition = vec4(attr_Position, 1.0);
	vec4 originalNormal = vec4(attr_Normal - vec3 (0.5), 0.0);

	for (int i = 0; i < 4; i++)
	{
		int boneIndex = int(attr_BoneIndexes[i]);
		position4 += (u_BoneMatrices[boneIndex] * originalPosition) * attr_BoneWeights[i];
#if defined(USE_TCGEN)
		normal4 += (u_BoneMatrices[boneIndex] * originalNormal) * attr_BoneWeights[i];
#endif //defined(USE_TCGEN)
	}

	vec3 position = position4.xyz;
#if defined(USE_TCGEN)
	vec3 normal = normalize (normal4.xyz);
#endif //defined(USE_TCGEN)

#else

	vec3 position  = attr_Position;
#if defined(USE_TCGEN)
	vec3 normal    = attr_Normal * 2.0 - 1.0;
#endif //defined(USE_TCGEN)

#endif

#if defined(USE_TCGEN)
	vec2 texCoords = GenTexCoords(u_TCGen0, position, normal, u_TCGen0Vector0, u_TCGen0Vector1);
#else
	vec2 texCoords = attr_TexCoord0.st;
#endif

#if defined(USE_TCMOD)
	var_TexCoords.xy = ModTexCoords(texCoords, position, u_DiffuseTexMatrix, u_DiffuseTexOffTurb);
#else
	var_TexCoords.xy = texCoords;
#endif

	if (!(u_textureScale.x == 0.0 && u_textureScale.y == 0.0) && !(u_textureScale.x == 1.0 && u_textureScale.y == 1.0))
	{
		var_TexCoords *= u_textureScale;
	}

	gl_Position = u_ModelViewProjectionMatrix * vec4(position, 1.0);
}

/*[Fragment]*/
uniform sampler2D u_DiffuseMap;

uniform vec2	u_Dimensions;
uniform vec4	u_Local4; // haveNormalMap, isMetalic, hasRealSubsurfaceMap, sway
uniform vec4	u_Local5; // hasRealOverlayMap, overlaySway, blinnPhong, hasSteepMap


uniform vec2				u_AlphaTestValues;

#define ATEST_NONE	0
#define ATEST_LT	1
#define ATEST_GT	2
#define ATEST_GE	3


varying vec2	var_TexCoords;
varying vec3	var_Position;
varying vec3	var_Normal;
varying vec4	var_Color;

out vec4 out_Glow;
out vec4 out_Position;
out vec4 out_Normal;
out vec4 out_PureNormal;

void main()
{
	vec2 texCoords = var_TexCoords;

	if (u_Local4.a > 0.0)
	{// Sway...
		texCoords += vec2(u_Local5.y * u_Local4.a * ((1.0 - texCoords.y) + 1.0), 0.0);
	}

	gl_FragColor = texture(u_DiffuseMap, texCoords);
	gl_FragColor.a *= var_Color.a;

	if (u_AlphaTestValues.r > 0.0)
	{
		if (u_AlphaTestValues.r == ATEST_LT)
			if (gl_FragColor.a >= u_AlphaTestValues.g)
				discard;
		if (u_AlphaTestValues.r == ATEST_GT)
			if (gl_FragColor.a <= u_AlphaTestValues.g)
				discard;
		if (u_AlphaTestValues.r == ATEST_GE)
			if (gl_FragColor.a < u_AlphaTestValues.g)
				discard;
	}

	out_Glow = vec4(0.0);
	out_Position = vec4(var_Position.rgb, 1024.0);
	out_Normal = vec4(var_Normal.rgb * 0.5 + 0.5, 0.0);
	out_PureNormal = vec4(var_Normal.rgb * 0.5 + 0.5, 0.0);
}
