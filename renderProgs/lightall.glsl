/*[Vertex]*/
attribute vec4 attr_TexCoord0;
uniform vec4	u_Local1; // parallaxScale, 0, 0, 0
uniform vec2	u_Dimensions;

#if defined(USE_TESSELLATION)
out vec3 Normal_CS_in;
out vec2 TexCoord_CS_in;
out vec4 WorldPos_CS_in;
out vec4 Tangent_CS_in;
out vec4 Bitangent_CS_in;
out vec4 Color_CS_in;
out vec4 PrimaryLightDir_CS_in;
out vec2 TexCoord2_CS_in;
out vec3 Blending_CS_in;
out float Slope_CS_in;
out float usingSteepMap_CS_in;
#endif

varying vec4	var_Local1; // parallaxScale, 0, 0, 0
varying vec2	var_Dimensions;

#if defined(USE_LIGHTMAP) || defined(USE_TCGEN)
attribute vec4 attr_TexCoord1;
#endif
attribute vec4 attr_Color;

attribute vec3 attr_Position;
attribute vec3 attr_Normal;
attribute vec4 attr_Tangent;

#if defined(USE_VERTEX_ANIMATION)
attribute vec3 attr_Position2;
attribute vec3 attr_Normal2;
attribute vec4 attr_Tangent2;
#endif

#if defined(USE_LIGHT) && !defined(USE_LIGHT_VECTOR)
attribute vec3 attr_LightDirection;
#endif

#if defined(USE_DELUXEMAP)
uniform vec4   u_EnableTextures; // x = normal, y = deluxe, z = specular, w = cube
#endif

#if !defined(USE_LIGHT)
uniform vec3   u_ViewOrigin;
varying vec3   var_Normal;
varying vec3   var_ViewDir;
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
uniform vec3   u_ViewOrigin;
#endif

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
uniform mat4   u_ViewProjectionMatrix;
uniform mat4   u_ModelMatrix;

uniform vec4   u_BaseColor;
uniform vec4   u_VertColor;

#if defined(USE_VERTEX_ANIMATION)
uniform float  u_VertexLerp;
#endif

#if defined(USE_LIGHT_VECTOR)
uniform vec4   u_LightOrigin;
uniform float  u_LightRadius;
uniform vec3   u_DirectedLight;
uniform vec3   u_AmbientLight;
#endif

#if defined(USE_PRIMARY_LIGHT) || defined(USE_SHADOWMAP)
uniform vec4  u_PrimaryLightOrigin;
uniform float u_PrimaryLightRadius;
#endif

varying vec2   var_TexCoords;
varying vec2   var_TexCoords2;

varying vec4   var_Color;
#if defined(USE_LIGHT_VECTOR) && !defined(USE_FAST_LIGHT)
varying vec4   var_ColorAmbient;
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
varying vec4   var_Normal;
varying vec4   var_Tangent;
varying vec4   var_Bitangent;
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
varying vec4   var_LightDir;
#endif

//#if defined(USE_PRIMARY_LIGHT) || defined(USE_SHADOWMAP)
varying vec4   var_PrimaryLightDir;
//#endif

varying vec3   var_vertPos;

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

float CalcLightAttenuation(float distance, float radius)
{
	float d = pow(distance / radius, 4.0);
	float attenuation = clamp(1.0 - d, 0.0, 1.0);
	attenuation *= attenuation;
	attenuation /= distance * distance + 1.0;
	// don't attenuate directional light
	attenuation = attenuation + float(radius < 1.0);

	return clamp(attenuation, 0.0, 1.0);
}

void main()
{
	vec3 normal = vec3(attr_Normal.xyz);
	vec3 position = vec3(attr_Position.xyz);

#if defined(USE_VERTEX_ANIMATION)
	 position  = mix(attr_Position,    attr_Position2,    u_VertexLerp);
	 normal    = mix(attr_Normal,      attr_Normal2,      u_VertexLerp);
  #if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
	vec3 tangent   = mix(attr_Tangent.xyz, attr_Tangent2.xyz, u_VertexLerp);
  #endif
#else
	position  = attr_Position;
	normal    = attr_Normal;
  #if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
	vec3 tangent   = attr_Tangent.xyz;
  #endif
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

	gl_Position = u_ModelViewProjectionMatrix * vec4(position, 1.0);

	vec3 preMMPos = position.xyz;
	vec3 preMMNorm = normal.xyz;
	
#if defined(USE_MODELMATRIX)
	position  = (u_ModelMatrix * vec4(position, 1.0)).xyz;
	normal    = (u_ModelMatrix * vec4(normal,   0.0)).xyz;
  #if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
	tangent   = (u_ModelMatrix * vec4(tangent,  0.0)).xyz;
  #endif
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
	vec3 bitangent = cross(normal, tangent) * attr_Tangent.w;
#endif

#if defined(USE_LIGHT_VECTOR)
	vec3 L = u_LightOrigin.xyz - (position * u_LightOrigin.w);
#elif defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
	vec3 L = attr_LightDirection;
  #if defined(USE_MODELMATRIX)
	L = (u_ModelMatrix * vec4(L, 0.0)).xyz;
	L += normal * 0.00001;
  #endif
#endif

#if defined(USE_LIGHTMAP)
	var_TexCoords2 = attr_TexCoord1.st;
#endif

	var_Color = u_VertColor * attr_Color + u_BaseColor;

#if defined(USE_LIGHT_VECTOR)
  #if defined(USE_FAST_LIGHT)
	float sqrLightDist = dot(L, L);
	float NL = clamp(dot(normalize(normal), L) / sqrt(sqrLightDist), 0.0, 1.0);
	float attenuation = CalcLightAttenuation(u_LightOrigin.w, u_LightRadius * u_LightRadius / sqrLightDist);

	var_Color.rgb *= u_DirectedLight * (attenuation * NL) + u_AmbientLight;
  #else
	var_ColorAmbient.rgb = u_AmbientLight * var_Color.rgb;
	var_Color.rgb *= u_DirectedLight;
    #if defined(USE_PBR)
	var_ColorAmbient.rgb *= var_ColorAmbient.rgb;
    #endif
  #endif
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT) && defined(USE_PBR)
	var_Color.rgb *= var_Color.rgb;
#endif

#if defined(USE_PRIMARY_LIGHT) || defined(USE_SHADOWMAP)
	var_PrimaryLightDir.xyz = u_PrimaryLightOrigin.xyz - (position * u_PrimaryLightOrigin.w);
	var_PrimaryLightDir.w = u_PrimaryLightRadius * u_PrimaryLightRadius;
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
  #if defined(USE_LIGHT_VECTOR)
	var_LightDir = vec4(L, u_LightRadius * u_LightRadius);
  #else
	var_LightDir = vec4(L, 0.0);
  #endif
  #if defined(USE_DELUXEMAP)
	var_LightDir -= u_EnableTextures.y * var_LightDir;
  #endif
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
	vec3 viewDir = u_ViewOrigin - position;
	// store view direction in tangent space to save on varyings
	var_Normal    = vec4(normal,    viewDir.x);
	var_Tangent   = vec4(tangent,   viewDir.y);
	var_Bitangent = vec4(bitangent, viewDir.z);
#endif

#if !defined(USE_LIGHT)
	vec3 viewDir = u_ViewOrigin - position;
	var_Normal = normal;
	var_ViewDir = viewDir;
#endif

	var_Local1 = u_Local1;
	var_Dimensions = u_Dimensions;
	var_vertPos = gl_Position.xyz;

#if defined(USE_TESSELLATION)
  WorldPos_CS_in = vec4(preMMPos, 1.0);
  TexCoord_CS_in = var_TexCoords.xy;
  Normal_CS_in = -preMMNorm.xyz;//-var_Normal.xyz;
  //Normal_CS_in = -var_Normal.xyz;
  //Tangent_CS_in = preMMtangent;//var_Tangent;
  //Bitangent_CS_in = preMMbitangent;//var_Bitangent;
  Tangent_CS_in = var_Tangent;
  Bitangent_CS_in = var_Bitangent;
  Color_CS_in = var_Color;
  PrimaryLightDir_CS_in = var_PrimaryLightDir;
  TexCoord2_CS_in = var_TexCoords2;
  Blending_CS_in = var_Blending;
  Slope_CS_in = var_Slope;
  usingSteepMap_CS_in = var_usingSteepMap;
  gl_Position = vec4(preMMPos, 1.0);

#endif //defined(USE_TESSELLATION)
}

/*[Fragment]*/
uniform sampler2D u_DiffuseMap;
uniform sampler2D u_SteepMap;

uniform vec2	u_Dimensions;
varying vec2	var_Dimensions;
uniform vec4	u_Local1; // parallaxScale, haveSpecular, specularScale, materialType
uniform vec4	u_Local2; // ExtinctionCoefficient
uniform vec4	u_Local3; // RimScalar, MaterialThickness, subSpecPower, cubemapScale
uniform vec4	u_Local4; // haveNormalMap, isMetalic, hasRealSubsurfaceMap, sway
uniform vec4	u_Local5; // hasRealOverlayMap, overlaySway, blinnPhong, hasSteepMap
uniform vec4	u_Local6; // useSunLightSpecular

#define SPHERICAL_HARMONICS
#define SUBSURFACE_SCATTER

#if defined(USE_LIGHTMAP)
uniform sampler2D u_LightMap;
#endif

//#if defined(USE_NORMALMAP)
uniform sampler2D u_NormalMap;
//#endif

#if defined(USE_DELUXEMAP)
uniform sampler2D u_DeluxeMap;
#endif

#if defined(USE_SPECULARMAP)
uniform sampler2D u_SpecularMap;
#endif

#if defined(USE_SHADOWMAP)
uniform sampler2D u_ShadowMap;
#endif

#if defined(USE_CUBEMAP)
#define textureCubeLod textureLod
uniform samplerCube u_CubeMap;
#endif

#if defined (SUBSURFACE_SCATTER)
uniform sampler2D u_SubsurfaceMap;
#endif
uniform sampler2D u_OverlayMap;

#if defined(USE_NORMALMAP) || defined(USE_DELUXEMAP) || defined(USE_SPECULARMAP) || defined(USE_CUBEMAP)
// y = deluxe, w = cube
uniform vec4      u_EnableTextures; 
#endif

//#if defined(USE_PRIMARY_LIGHT) || defined(USE_SHADOWMAP)
uniform vec3  u_PrimaryLightColor;
uniform vec3  u_PrimaryLightAmbient;
//#endif

#if !defined(USE_LIGHT)
uniform vec4   u_NormalScale;
varying vec3   var_Normal;
#endif

//varying vec3   var_ViewDir;

varying vec3 var_N;

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
uniform vec4      u_NormalScale;
uniform vec4      u_SpecularScale;
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
#if defined(USE_CUBEMAP)
uniform vec4      u_CubeMapInfo;
uniform float     u_CubeMapStrength;
#endif
#endif

uniform int       u_AlphaTest;
varying vec4      var_Color;
#if (defined(USE_LIGHT) && !defined(USE_FAST_LIGHT))
varying vec4      var_ColorAmbient;
#endif

#if (defined(USE_LIGHT) && !defined(USE_FAST_LIGHT))
varying vec4   var_Normal;
varying vec4   var_Tangent;
varying vec4   var_Bitangent;
#endif

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
varying vec4      var_LightDir;
#endif

//#if defined(USE_PRIMARY_LIGHT) || defined(USE_SHADOWMAP)
varying vec4      var_PrimaryLightDir;
//#endif

#if defined(USE_TESSELLATION) || defined(USE_ICR_CULLING)

in vec3				Normal_FS_in;
in vec2				TexCoord_FS_in;
in vec3				WorldPos_FS_in;
in vec3				ViewDir_FS_in;
in vec4				Tangent_FS_in;
in vec4				Bitangent_FS_in;

in vec4				Color_FS_in;
in vec4				PrimaryLightDir_FS_in;
in vec2				TexCoord2_FS_in;

in vec3				Blending_FS_in;
in float				Slope_FS_in;
in float				usingSteepMap_FS_in;

//vec3 m_Normal =				normalize(-Normal_FS_in.xyz);
#define m_Normal 			normalize(-Normal_FS_in.xyz)

#define m_TexCoords			TexCoord_FS_in
#define m_vertPos			WorldPos_FS_in
#define m_ViewDir			ViewDir_FS_in

#define var_Normal2			ViewDir_FS_in.x

#define var_Tangent			Tangent_FS_in
#define var_Bitangent		Bitangent_FS_in

#define var_nonTCtexCoords	TexCoord_FS_in
#define var_Color			Color_FS_in
#define	var_PrimaryLightDir PrimaryLightDir_FS_in
#define var_TexCoords2		TexCoord2_FS_in

#define var_Blending		Blending_FS_in
#define var_Slope			Slope_FS_in
#define var_usingSteepMap	usingSteepMap_FS_in


#else //!defined(USE_TESSELLATION) && !defined(USE_ICR_CULLING)

varying vec2				var_TexCoords;
varying vec2				var_TexCoords2;
//varying vec4				var_Normal;

#define var_Normal2			var_Normal.w

//varying vec4				var_Tangent;
//varying vec4				var_Bitangent;
//varying vec4				var_Color;

varying vec3				var_vertPos;

varying vec3				var_ViewDir;
varying vec2				var_nonTCtexCoords; // for steep maps

uniform int			u_lightCount;
uniform vec3		u_lightPositions2[16];
uniform float		u_lightDistances[16];
uniform vec3		u_lightColors[16];

varying vec3				var_Blending;
varying float				var_Slope;
varying float				var_usingSteepMap;


#define m_Normal			var_Normal
#define m_TexCoords			var_TexCoords
#define m_vertPos			var_vertPos
#define m_ViewDir			var_ViewDir

#endif //defined(USE_TESSELLATION) || defined(USE_ICR_CULLING)

out vec4 out_Glow;
out vec4 out_Normal;
out vec4 out_DetailedNormal;
out vec4 out_Position;

#if defined(USE_LIGHT_VECTOR)
uniform vec4   u_LightOrigin;
#endif

#define EPSILON 0.00000001

#if defined(USE_PARALLAXMAP) || defined(USE_PARALLAXMAP_NONORMALS)
  #if defined(USE_PARALLAXMAP)
	float SampleDepth(sampler2D normalMap, vec2 t)
	{
		return 1.0 - texture2D(normalMap, t).a;
	}
  #endif //USE_PARALLAXMAP

float RayIntersectDisplaceMap(vec2 dp, vec2 ds, sampler2D normalMap)
{
	if (u_Local1.x == 0.0)
		return 0.0;
	
  #if !defined(FAST_PARALLAX)
	float MAX_SIZE = u_Local1.x / 3.0;//1.25;//1.5;//1.0;
	if (MAX_SIZE > 1.75) MAX_SIZE = 1.75;
	if (MAX_SIZE < 1.0) MAX_SIZE = 1.0;
	const int linearSearchSteps = 16;
	const int binarySearchSteps = 6;

	// current size of search window
	float size = MAX_SIZE / float(linearSearchSteps);

	// current depth position
	float depth = 0.0;

	// best match found (starts with last position 1.0)
	float bestDepth = MAX_SIZE;

	// texture depth at best depth
	float texDepth = 0.0;

	float prevT = SampleDepth(normalMap, dp);
	float prevTexDepth = prevT;

	// search front to back for first point inside object
	for(int i = 0; i < linearSearchSteps - 1; ++i)
	{
		depth += size;
		
		float t = SampleDepth(normalMap, dp + ds * depth) * MAX_SIZE;
		
		//if(bestDepth > 0.996)		// if no depth found yet
		if(bestDepth > MAX_SIZE - (MAX_SIZE / linearSearchSteps))		// if no depth found yet
			if(depth >= t)
			{
				bestDepth = depth;	// store best depth
				texDepth = t;
				prevTexDepth = prevT;
			}
		prevT = t;
	}

	depth = bestDepth;
	
#if !defined (USE_RELIEFMAP)
	float div = 1.0 / (1.0 + (prevTexDepth - texDepth) * float(linearSearchSteps));
	bestDepth -= (depth - size - prevTexDepth) * div;
#else
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
#endif

	return bestDepth * u_Local1.x;
#else //FAST_PARALLAX
	float depth = SampleDepth(normalMap, dp) - 1.0;
	return depth * u_Local1.x;
#endif //FAST_PARALLAX
}
#endif //USE_PARALLAXMAP || USE_PARALLAXMAP_NONORMALS

vec3 CalcDiffuse(vec3 diffuseAlbedo, float NH, float EH, float roughness)
{
#if defined(USE_BURLEY)
	// modified from https://disney-animation.s3.amazonaws.com/library/s2012_pbs_disney_brdf_notes_v2.pdf
	float fd90 = -0.5 + EH * EH * roughness;
	float burley = 1.0 + fd90 * 0.04 / NH;
	burley *= burley;
	return diffuseAlbedo * burley;
#else
	return diffuseAlbedo;
#endif
}

vec2 GetParallaxOffset(in vec2 texCoords, in vec3 E, in mat3 tangentToWorld )
{
#if defined(USE_PARALLAXMAP)
	vec3 offsetDir = normalize(E * tangentToWorld);
	offsetDir.xy *= -u_NormalScale.a / offsetDir.z;

	return offsetDir.xy * RayIntersectDisplaceMap(texCoords, offsetDir.xy, u_NormalMap);
#else
	return vec2(0.0);
#endif
}

vec3 EnvironmentBRDF(float roughness, float NE, vec3 specular)
{
	// from http://community.arm.com/servlet/JiveServlet/download/96891546-19496/siggraph2015-mmg-renaldas-slides.pdf
	float v = 1.0 - max(roughness, NE);
	v *= v * v;
	return vec3(v) + specular;
}

float CalcLightAttenuation(float distance, float radius)
{
	float d = pow(distance / radius, 4.0);
	float attenuation = clamp(1.0 - d, 0.0, 1.0);
	attenuation *= attenuation;
	attenuation /= distance * distance + 1.0;
	// don't attenuate directional light
	attenuation = attenuation + float(radius < 1.0);

	return clamp(attenuation, 0.0, 1.0);
}

//---------------------------------------------------------
// get pseudo 3d bump background
//---------------------------------------------------------
vec4 BumpyBackground (sampler2D texture, vec2 pos)
{
  #define LINEAR_STEPS 20
  #define DISTANCE 0.16
  #define FEATURES 0.5

  vec4 color = vec4(0.0);
  vec2 dir = -(vec2(pos - vec2(0.5, 0.5)) * (DISTANCE / LINEAR_STEPS)) * 0.5;
    
  for (float i = 0.0; i < LINEAR_STEPS; i++) 
  {
    vec4 pixel1 = texture2D(texture, pos - i * dir);
    if (pow(length(pixel1.rgb) / 1.4, 0.20) * (1.0 - FEATURES)
       +pow(length(texture2D(texture, (pos - i * dir) * 2.0).rgb) / 1.4, 0.90) * FEATURES
       > i / LINEAR_STEPS) 
    //color = pixel1 * i / LINEAR_STEPS;
    color += 0.16 * pixel1 * i / LINEAR_STEPS;
  }
  return color;
}

float blinnPhongSpecular(in vec3 normalVec, in vec3 lightVec, in float specPower)
{
    vec3 halfAngle = normalize(normalVec + lightVec);
    return pow(clamp(dot(normalVec,halfAngle),0.0,1.0),specPower);
}

#if defined(USE_LIGHT_VECTOR) && !defined(USE_FAST_LIGHT)
float halfLambert(in vec3 vect1, in vec3 vect2)
{
    float product = dot(vect1,vect2);
    return product * 0.5 + 0.5;
}

#ifdef SUBSURFACE_SCATTER 
// Main fake sub-surface scatter lighting function
vec3 ExtinctionCoefficient = u_Local2.xyz;
float RimScalar = u_Local3.x;
float MaterialThickness = u_Local3.y;
float SpecPower = u_Local3.z;

vec4 subScatterFS(vec4 BaseColor, vec4 SpecColor, vec3 lightVec, vec3 LightColor, vec3 eyeVec, vec3 worldNormal, vec2 texCoords)
{
	vec4 subsurface = vec4(ExtinctionCoefficient, MaterialThickness);

	if (u_Local4.z != 0.0)
	{// We have a subsurface image, use it instead...
		subsurface = texture2D(u_SubsurfaceMap, texCoords.xy);
	}
	else if (length(ExtinctionCoefficient) == 0.0)
	{// Default if not specified...
		subsurface.rgb = vec3(BaseColor.rgb);
	}

	if (MaterialThickness == 0.0)
	{// Default if not specified...
		MaterialThickness = 0.8;
	}
	
	if (subsurface.a == 0.0 && MaterialThickness != 0.0)
	{// Backup in case image is missing alpha channel...
		subsurface.a = MaterialThickness;
	}

	subsurface.a = 1.0 - subsurface.a;

	if (RimScalar == 0.0)
	{// Default if not specified...
		RimScalar = 0.5;
	}

	if (SpecPower == 0.0)
	{// Default if not specified...
		SpecPower = 0.3;
	}

	float attenuation = 10.0 * (1.0 / distance(u_LightOrigin.xyz,m_vertPos.xyz));
    vec3 eVec = normalize(eyeVec);
    vec3 lVec = normalize(lightVec);
    vec3 wNorm = normalize(worldNormal);
     
    vec4 dotLN = vec4(halfLambert(lVec,wNorm) * attenuation);
    dotLN *= BaseColor;
     
    vec3 indirectLightComponent = vec3(subsurface.a * max(0.0,dot(-wNorm,lVec)));
    indirectLightComponent += subsurface.a * halfLambert(-eVec,lVec);
    indirectLightComponent *= attenuation;
    indirectLightComponent.r *= subsurface.r;
    indirectLightComponent.g *= subsurface.g;
    indirectLightComponent.b *= subsurface.b;
     
    vec3 rim = vec3(1.0 - max(0.0,dot(wNorm,eVec)));
    rim *= rim;
    rim *= max(0.0,dot(wNorm,lVec)) * SpecColor.rgb;
     
    vec4 finalCol = dotLN + vec4(indirectLightComponent,1.0);
    finalCol.rgb += (rim * RimScalar * attenuation * finalCol.a);
    finalCol.rgb += vec3(blinnPhongSpecular(wNorm,lVec,SpecPower) * attenuation * SpecColor * finalCol.a * 0.05);
    finalCol.rgb *= LightColor.rgb;
     
    return finalCol;   
}
#endif //SUBSURFACE_SCATTER
#endif

#ifdef SPHERICAL_HARMONICS
vec3 sphericalHarmonics(vec3 normal)
{
   const float C1 = 0.429043;
   const float C2 = 0.511664;
   const float C3 = 0.743125;
   const float C4 = 0.886227;
   const float C5 = 0.247708;
   
   const vec3 L00  = vec3( 0.6841148,  0.6929004,  0.7069543);
   const vec3 L1m1 = vec3( 0.3173355,  0.3694407,  0.4406839);
   const vec3 L10  = vec3(-0.1747193, -0.1737154, -0.1657420);
   const vec3 L11  = vec3(-0.4496467, -0.4155184, -0.3416573);
   const vec3 L2m2 = vec3(-0.1690202, -0.1703022, -0.1525870);
   const vec3 L2m1 = vec3(-0.0837808, -0.0940454, -0.1027518);
   const vec3 L20  = vec3(-0.0319670, -0.0214051, -0.0147691);
   const vec3 L21  = vec3( 0.1641816,  0.1377558,  0.1010403);
   const vec3 L22  = vec3( 0.3697189,  0.3097930,  0.2029923);
   
   return C1 * L22 * (normal.x * normal.x - normal.y * normal.y) +
          C3 * L20 * normal.z * normal.z +
          C4 * L00 -
          C5 * L20 +
          2.0 * C1 * L2m2 * normal.x * normal.y +
          2.0 * C1 * L21  * normal.x * normal.z +
          2.0 * C1 * L2m1 * normal.y * normal.z +
          2.0 * C2 * L11  * normal.x +
          2.0 * C2 * L1m1 * normal.y +
          2.0 * C2 * L10  * normal.z;
}
#endif //SPHERICAL_HARMONICS

vec4 hitCube(vec3 ray, vec3 pos, vec3 invSize, float lod, samplerCube tex)
{
	// find any hits on cubemap faces facing the camera
	vec3 scale = (sign(ray) - pos) / ray;

	// find the nearest hit
	float minScale = min(min(scale.x, scale.y), scale.z);

	// if the nearest hit is behind the camera, ignore
	// should not be necessary as long as pos is inside the cube
	//if (minScale < 0.0)
		//return vec4(0.0);

	// calculate the hit position, that's our texture coordinates
	vec3 tc = pos + ray * minScale;

	// if the texture coordinates are outside the cube, ignore
	// necessary since we're not fading out outside the cube
	if (any(greaterThan(abs(tc), vec3(1.00001))))
		return vec4(0.0);

	// fade out when approaching the cubemap edges
	//vec3 fade3 = abs(pos);
	//float fade = max(max(fade3.x, fade3.y), fade3.z);
	//fade = clamp(1.0 - fade, 0.0, 1.0);

	//return vec4(textureCubeLod(tex, tc, lod).rgb * fade, fade);
	return vec4(textureCubeLod(tex, tc, lod).rgb, 1.0);
}

void main()
{
	vec3 viewDir = vec3(0.0), lightColor = vec3(0.0), ambientColor = vec3(0.0), reflectance = vec3(0.0);
	vec4 specular = vec4(0.0);
	vec3 L, N, E, H;
	vec3 DETAILED_NORMAL = vec3(1.0);
	float NL, NH, NE, EH, attenuation;
	vec2 tex_offset = vec2(1.0 / u_Dimensions);

#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
	mat3 tangentToWorld = mat3(var_Tangent.xyz, var_Bitangent.xyz, m_Normal.xyz);
	#if !defined(USE_TESSELLATION)
		viewDir = vec3(var_Normal2, var_Tangent.w, var_Bitangent.w);
	#else //defined(USE_TESSELLATION)
		viewDir = m_ViewDir.xyz;
	#endif //defined(USE_TESSELLATION)
	E = normalize(viewDir);
#endif

	lightColor = var_Color.rgb;

#if defined(USE_LIGHTMAP)
	vec4 lightmapColor = texture2D(u_LightMap, var_TexCoords2.st);
  #if defined(RGBM_LIGHTMAP)
	lightmapColor.rgb *= lightmapColor.a;
  #endif
  #if defined(USE_PBR) && !defined(USE_FAST_LIGHT)
	lightmapColor.rgb *= lightmapColor.rgb;
  #endif
	lightColor *= lightmapColor.rgb;
#endif

	vec2 texCoords = m_TexCoords.xy;	
	
#ifdef USE_OVERLAY//USE_SWAY
	if (u_Local4.a > 0.0)
	{// Sway...
		texCoords += vec2(u_Local5.y * u_Local4.a * ((1.0 - m_TexCoords.y) + 1.0), 0.0);
	}
#endif
	
	//vec4 diffuse;
	//vec4 diffuse = texture2D(u_DiffuseMap, texCoords);
	vec4 diffuse = BumpyBackground(u_DiffuseMap, texCoords);

#if defined(USE_PARALLAXMAP) || defined(USE_PARALLAXMAP_NONORMALS)
	// Faster but sucky...
	vec3 offsetDir = normalize(E * tangentToWorld);
	offsetDir.xy *= tex_offset * -u_Local1.x;//-4.0;//-5.0; // -3.0
	texCoords += offsetDir.xy * RayIntersectDisplaceMap(texCoords, offsetDir.xy, u_NormalMap);
#endif

	diffuse = texture2D(u_DiffuseMap, texCoords);
	
	float alpha = diffuse.a * var_Color.a;
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


#if defined(USE_LIGHT) && !defined(USE_FAST_LIGHT)
	L = var_LightDir.xyz;
  #if defined(USE_DELUXEMAP)
	L += (texture2D(u_DeluxeMap, var_TexCoords2.st).xyz - vec3(0.5)) * u_EnableTextures.y;
  #endif
	float sqrLightDist = dot(L, L);

  #if defined(USE_LIGHT_VECTOR)
	attenuation  = CalcLightAttenuation(float(var_LightDir.w > 0.0), var_LightDir.w / sqrLightDist);
  #else
	attenuation  = 1.0;
  #endif

	vec4 norm = texture2D(u_NormalMap, texCoords);
	N = norm.xyz * 2.0 - 1.0;
	N.xy *= u_NormalScale.xy;
	//N.xyz *= u_NormalScale.xyx;
	N.z = sqrt(clamp((0.25 - N.x * N.x) - N.y * N.y, 0.0, 1.0));
	N = tangentToWorld * N;
	N = normalize(N);

	DETAILED_NORMAL = N;

	L /= sqrt(sqrLightDist);
	
#ifdef USE_OVERLAY//USE_STEEPMAP
	if (u_Local5.a > 0.0)
	{
		float slope = dot(normalize(N.xyz/*var_Normal.xyz*/),vec3(0.0,1.0,0.0));
		if (slope < 0.0) slope = slope *= -1.0;
		float slope2 = dot(normalize(N.xyz/*var_Normal.xyz*/),vec3(0.0,0.0,1.0));
		if (slope2 < 0.0) slope2 = slope2 *= -1.0;
		float slope3 = dot(normalize(N.xyz/*var_Normal.xyz*/),vec3(1.0,0.0,0.0));
		if (slope3 < 0.0) slope3 = slope3 *= -1.0;
		slope = length(slope + slope2 + slope3) / 3.0;
		//slope = pow(slope, 0.85);
		vec4 steepDiffuse = texture2D(u_SteepMap, texCoords);
		diffuse.rgb = mix( diffuse.rgb, steepDiffuse.rgb, clamp(slope,0.0,1.0));
	}
	

#define OVERLAY_HEIGHT 40.0

	if (u_Local5.x > 0.0)
	{// Have overlay map...
		vec2 ovCoords = var_TexCoords.xy + vec2(u_Local5.y); // u_Local5.y == sway ammount
		vec4 overlay = texture2D(u_OverlayMap, ovCoords);

		if (overlay.a > 0.1)
		{// Have an overlay, and it is visible here... Set it as diffuse instead...
			diffuse = overlay;
		}
		else
		{// Have an overlay, but it is not visibile at this pixel... Still need to check if we need a shadow casted on this pixel...
			vec2 ovCoords2 = ovCoords - (tex_offset * OVERLAY_HEIGHT);
			vec4 overlay2 = texture2D(u_OverlayMap, ovCoords2);

			if (overlay2.a > 0.1)
			{// Add shadow...
				diffuse.rgb *= 0.25;
			}
		}
#endif

	ambientColor = vec3(0.0);
	lightColor = var_Color.rgb;
	attenuation = 1.0;

	#if defined(USE_LIGHTMAP)
		float lmBrightMult = clamp(1.0 - (length(lightmapColor.rgb) / 3.0), 0.0, 0.9);
		lmBrightMult *= lmBrightMult;
		lightColor	= lightmapColor.rgb * lmBrightMult * (var_Color.rgb * 0.66666 + 0.33333); // UQ1:  * 0.66666 + 0.33333 is because they are too dark...
	#endif

	#if defined(USE_LIGHTMAP)

		ambientColor = lightColor;
		float surfNL = clamp(-dot(var_PrimaryLightDir.xyz, N.xyz/*m_Normal.xyz*/), 0.0, 1.0);
		lightColor /= max(surfNL, 0.25);
		ambientColor = clamp(ambientColor - lightColor * surfNL, 0.0, 1.0);

	#endif //defined(USE_LIGHTMAP)
	
	NL = clamp(dot(N, L), 0.0, 1.0);
	NE = clamp(dot(N, E), 0.0, 1.0);
	H = normalize(L + E);
	EH = clamp(dot(E, H), 0.0, 1.0);
	NH = clamp(dot(N, H), 0.0, 1.0);
	
	gl_FragColor = vec4(0.0);

  #if defined(USE_SPECULARMAP)
	if (u_Local1.g != 0.0)
	{
		// Real specMap...
		specular = texture2D(u_SpecularMap, texCoords);
	}
	else
	{		
		specular = vec4(1.0);
	}
  #endif

	if (u_Local1.b > 0.0)
	{
		if (u_SpecularScale.r + u_SpecularScale.g + u_SpecularScale.b + u_SpecularScale.a != 0.0) // Shader Specified...
			specular *= u_SpecularScale;
		else // Material Defaults...
		{
			specular *= u_Local1.b;
			
			if (u_Local4.b != 0.0 /* METALS */
				&& u_Local1.a != 30.0 /* ARMOR */ 
				&& u_Local1.a != 10.0 /* GLASS */ 
				&& u_Local1.a != 29.0 /* SHATTERGLASS */ 
				&& u_Local1.a != 18.0 /* BPGLASS */ 
				&& u_Local1.a != 31.0 /* COMPUTER */
				&& u_Local1.a != 15.0 /* ICE */
				&& u_Local1.a != 25.0 /* PLASTIC */
				&& u_Local1.a != 12.0 /* MARBLE */)
			{// Only if not metalic... Metals should remain nice and shiny...
				specular.rgb *= u_SpecularScale.rgb;
			}
		}
	}
	else
		specular *= u_SpecularScale;
		
  #if defined(USE_PBR)
	// diffuse rgb is base color
	// specular red is gloss
	// specular green is metallicness
	float gloss = specular.r;
	float metal = specular.g;
	specular.rgb = metal * diffuse.rgb + vec3(0.04 - 0.04 * metal);
	diffuse.rgb *= 1.0 - metal;
  #else
	// diffuse rgb is diffuse
	// specular rgb is specular reflectance at normal incidence
	// specular alpha is gloss
	float gloss = 1.0 - min(specular.a, 0.96);

	// adjust diffuse by specular reflectance, to maintain energy conservation
	diffuse.rgb -= specular.rgb * (1.0 - u_EnableTextures.z);
  #endif

  #if defined(GLOSS_IS_GLOSS)
	float roughness = exp2(-3.0 * gloss);
  #elif defined(GLOSS_IS_SMOOTHNESS)
	float roughness = 1.0 - gloss;
  #elif defined(GLOSS_IS_ROUGHNESS)
	float roughness = gloss;
  #elif defined(GLOSS_IS_SHININESS)
	float roughness = pow(2.0 / (8190.0 * gloss + 2.0), 0.25);
  #endif

  #if defined(USE_PBR)
	diffuse.rgb *= diffuse.rgb;
	specular.rgb *= specular.rgb;
  #endif

    H  = normalize(L + E);
    EH = max(1e-8, dot(E, H));
    NH = max(1e-8, dot(N, H));
    NL = clamp(dot(N, L), 1e-8, 1.0);
	
	// Reduce brightness of really bright spots (eg: light right above a reflective surface)
	float refMult = (specular.r + specular.g + specular.b + specular.a) / 4.0;
	refMult = 1.0 - refMult;
	refMult = clamp(refMult, 0.25, 0.75);

	reflectance = diffuse.rgb;

	#if defined(r_deluxeSpecular) || defined(USE_LIGHT_VECTOR)
		float lambertian = dot(L.xyz,N);
		float spec = 0.0;

		if(lambertian > 0.0)
		{// this is blinn phong
			vec3 halfDir = normalize(L.xyz + E);
			float specAngle = max(dot(halfDir, N), 0.0);
			spec = pow(specAngle, 16.0);
			reflectance.rgb += vec3(spec * (1.0 - specular.a)) * reflectance.rgb * lightColor.rgb * u_Local5.b;
		}
	#endif


	gl_FragColor.rgb  += lightColor   * reflectance * (attenuation/* * NL*/);
	gl_FragColor.rgb += ambientColor * (diffuse.rgb + (specular.rgb * refMult));

	if (u_Local5.b > 0.0)
	{
		float blinnPhong = clamp(blinnPhongSpecular(N, var_LightDir.xyz, specular.a), 0.0, 1.0);
		//gl_FragColor.rgb = (gl_FragColor.rgb + (blinnPhong*gl_FragColor.rgb)) / 2.0;
		gl_FragColor.rgb *= (blinnPhong * u_Local5.b);
	}
	
  #if defined(USE_CUBEMAP)
	NE = clamp(dot(N, E), 0.0, 1.0);
	reflectance = EnvironmentBRDF(specular.a * refMult, NE, specular.rgb * refMult);

	vec3 R = reflect(E, N);

	// parallax corrected cubemap (cheaper trick)
	// from http://seblagarde.wordpress.com/2012/09/29/image-based-lighting-approaches-and-parallax-corrected-cubemap/
	vec3 parallax = u_CubeMapInfo.xyz + u_CubeMapInfo.w * viewDir;

  #if defined(USE_BOX_CUBEMAP_PARALLAX)
	vec3 cubeLightColor = hitCube(R * u_CubeMapInfo.w, parallax, u_CubeMapInfo.www, ROUGHNESS_MIPS * roughness, u_CubeMap).rgb * u_EnableTextures.w;
  #else
	vec3 cubeLightColor = textureCubeLod(u_CubeMap, R + parallax, ROUGHNESS_MIPS * roughness).rgb * u_EnableTextures.w;
  #endif
  
	// normalize cubemap based on last roughness mip (~diffuse)
	// multiplying cubemap values by lighting below depends on either this or the cubemap being normalized at generation
	vec3 cubeLightDiffuse = max(textureCubeLod(u_CubeMap, N, ROUGHNESS_MIPS).rgb, 0.5 / 255.0);
	cubeLightColor /= dot(cubeLightDiffuse, vec3(0.2126, 0.7152, 0.0722));

	float horiz = 1.0;
	// from http://marmosetco.tumblr.com/post/81245981087
	#if defined(HORIZON_FADE)
		const float horizonFade = HORIZON_FADE;
		horiz = clamp( 1.0 + horizonFade * dot(R,m_Normal.xyz), 0.0, 1.0 );
		horiz = 1.0 - horiz;
		horiz *= horiz;
	#endif

	#if defined(USE_PBR)
		cubeLightColor *= cubeLightColor + cubeLightColor * refMult;
	#endif

	// multiply cubemap values by lighting
	// not technically correct, but helps make reflections look less unnatural
	cubeLightColor *= lightColor * (attenuation * NL) + ambientColor;

	gl_FragColor.rgb += cubeLightColor * reflectance * horiz * (u_Local3.a * refMult) * u_CubeMapStrength * 0.5;
	
	if (u_Local5.r > 0.0)
	{
		// Image based lighting...
		// view vector reflected with respect to normal
		vec3 R = reflect(E, N);

		vec3 parallax = u_CubeMapInfo.xyz + u_CubeMapInfo.w * var_vertPos.xyz;

		vec3 ambLighting	= textureCubeLod(u_CubeMap, N + parallax, 7.0 * 7.0).rgb;
		vec3 speLighting	= textureCubeLod(u_CubeMap, R + parallax, 7.0 * 7.0).rgb;

		vec3 ill = ((ambLighting * 0.6) + (speLighting * 0.4)) * 0.5 + 0.5;
		ill *= u_Local5.r;
		gl_FragColor.rgb *= clamp((ill * ((gl_FragColor.rgb * gl_FragColor.rgb) * 0.5 + 0.5)), 0.9, 3.0);
		//gl_FragColor.rgb = ((ill * gl_FragColor.rgb) * (vec3(3.0)-length(gl_FragColor.rgb)) + (ill * gl_FragColor.rgb * gl_FragColor.rgb)) / 2.0;
		gl_FragColor.rgb = clamp(gl_FragColor.rgb, 0.0, 1.0);
	}
  #endif

	#if defined(USE_PRIMARY_LIGHT) || defined(USE_PRIMARY_LIGHT_SPECULAR)
		if (u_Local6.r > 0.0)
		{
			float lambertian2 = dot(var_PrimaryLightDir.xyz,N);
			float spec2 = 0.0;

			if(lambertian2 > 0.0)
			{// this is blinn phong
				vec3 halfDir2 = normalize(var_PrimaryLightDir.xyz + E);
				float specAngle = max(dot(halfDir2, N), 0.0);
				spec2 = pow(specAngle, 16.0);
				gl_FragColor.rgb += vec3(spec2 * (1.0 - specular.a)) * gl_FragColor.rgb * u_PrimaryLightColor.rgb * u_Local5.b;
			}

			for (int li = 0; li < u_lightCount; li++)
			{
				vec3 lightDir = u_lightPositions2[li] - var_vertPos.xyz;
				float lambertian3 = dot(lightDir.xyz,N);
				float spec3 = 0.0;

				if(lambertian3 > 0.0)
				{
					float lightStrength = clamp(1.0 - (length(lightDir) * (1.0 / u_lightDistances[li])), 0.0, 1.0) * 0.5;

					if(lightStrength > 0.0)
					{// this is blinn phong
						vec3 halfDir3 = normalize(lightDir.xyz + E);
						float specAngle3 = max(dot(halfDir3, N), 0.0);
						spec3 = pow(specAngle3, 16.0);
						gl_FragColor.rgb += vec3(spec3 * (1.0 - specular.a)) * u_lightColors[li].rgb * lightStrength * u_Local5.b;
					}
				}
			}
		}
	#endif

  #if defined(USE_PBR)
	gl_FragColor.rgb = sqrt(gl_FragColor.rgb);
  #endif

  gl_FragColor.a = diffuse.a * var_Color.a;

#ifdef SUBSURFACE_SCATTER
  #if defined(USE_LIGHT_VECTOR) && !defined(USE_FAST_LIGHT)
  // Let's add some sub-surface scatterring shall we???
  if (MaterialThickness > 0.0 || u_Local4.z != 0.0 /*|| u_Local1.a == 5 || u_Local1.a == 6 || u_Local1.a == 12 
	|| u_Local1.a == 14 || u_Local1.a == 15 || u_Local1.a == 16 || u_Local1.a == 17 || u_Local1.a == 19 
	|| u_Local1.a == 20 || u_Local1.a == 21 || u_Local1.a == 22*/)
  {
  #if defined(USE_PRIMARY_LIGHT)
	gl_FragColor.rgb += subScatterFS(gl_FragColor, specular, L, lightColor.xyz, E, N, texCoords).rgb;
  #else
	gl_FragColor.rgb += subScatterFS(gl_FragColor, specular, L, var_Color.xyz, E, N, texCoords).rgb;
  #endif
	gl_FragColor = clamp(gl_FragColor, 0.0, 1.0);
  }
  #endif  
#endif //SUBSURFACE_SCATTER

#ifdef SPHERICAL_HARMONICS
  gl_FragColor.rgb *= sphericalHarmonics(N);
#endif //SPHERICAL_HARMONICS

#else
  lightColor = var_Color.rgb;

  #if defined(USE_LIGHTMAP) 
    lightColor *= lightmapColor.rgb;
  #endif
  
  gl_FragColor.rgb = diffuse.rgb * lightColor;

  gl_FragColor = vec4 (diffuse.rgb * lightColor, diffuse.a * var_Color.a);
  
#ifdef SPHERICAL_HARMONICS
  gl_FragColor.rgb *= sphericalHarmonics(N);
#endif //SPHERICAL_HARMONICS
#endif

	out_DetailedNormal = vec4(DETAILED_NORMAL.xyz, specular.a / 8.0);

  gl_FragColor.a = alpha;
}

/*[Geometry]*/
layout(triangles) in;
layout(triangle_strip, max_vertices = 3) out;

uniform mat4				u_ModelViewProjectionMatrix;

uniform vec3				u_ViewOrigin;

in vec4 WorldPos_CS_in[];
in vec3 Normal_CS_in[];
in vec2 TexCoord_CS_in[];
in vec3 ViewDir_CS_in[];
in vec4 Tangent_CS_in[];
in vec4 Bitangent_CS_in[];
in vec4 Color_CS_in[];
in vec4 PrimaryLightDir_CS_in[];
in vec2 TexCoord2_CS_in[];
in vec3 Blending_CS_in[];
in float Slope_CS_in[];
in float usingSteepMap_CS_in[];

out vec3 WorldPos_FS_in;
out vec2 TexCoord_FS_in;
out vec3 Normal_FS_in;
out vec3 ViewDir_FS_in;
out vec4 Tangent_FS_in;
out vec4 Bitangent_FS_in;
out vec4 Color_FS_in;
out vec4 PrimaryLightDir_FS_in;
out vec2 TexCoord2_FS_in;
out vec3 Blending_FS_in;
out float Slope_FS_in;
out float usingSteepMap_FS_in;

//
// Normally this is meant to be done in a pre-pass, but that would be slower...
//
bool InstanceCloudReductionCulling(vec4 InstancePosition, vec3 ObjectExtent) 
{
	/* create the bounding box of the object */
	vec4 BoundingBox[8];
	BoundingBox[0] = u_ModelViewProjectionMatrix * ( InstancePosition + vec4( ObjectExtent.x, ObjectExtent.y, ObjectExtent.z, 1.0) );
	BoundingBox[1] = u_ModelViewProjectionMatrix * ( InstancePosition + vec4(-ObjectExtent.x, ObjectExtent.y, ObjectExtent.z, 1.0) );
	BoundingBox[2] = u_ModelViewProjectionMatrix * ( InstancePosition + vec4( ObjectExtent.x,-ObjectExtent.y, ObjectExtent.z, 1.0) );
	BoundingBox[3] = u_ModelViewProjectionMatrix * ( InstancePosition + vec4(-ObjectExtent.x,-ObjectExtent.y, ObjectExtent.z, 1.0) );
	BoundingBox[4] = u_ModelViewProjectionMatrix * ( InstancePosition + vec4( ObjectExtent.x, ObjectExtent.y,-ObjectExtent.z, 1.0) );
	BoundingBox[5] = u_ModelViewProjectionMatrix * ( InstancePosition + vec4(-ObjectExtent.x, ObjectExtent.y,-ObjectExtent.z, 1.0) );
	BoundingBox[6] = u_ModelViewProjectionMatrix * ( InstancePosition + vec4( ObjectExtent.x,-ObjectExtent.y,-ObjectExtent.z, 1.0) );
	BoundingBox[7] = u_ModelViewProjectionMatrix * ( InstancePosition + vec4(-ObjectExtent.x,-ObjectExtent.y,-ObjectExtent.z, 1.0) );
   
	/* check how the bounding box resides regarding to the view frustum */   
	int outOfBound[6];// = int[6]( 0, 0, 0, 0, 0, 0 );

	for (int i=0; i<6; i++)
		outOfBound[i] = 0;

	for (int i=0; i<8; i++)
	{
		if ( BoundingBox[i].x >  BoundingBox[i].w ) outOfBound[0]++;
		if ( BoundingBox[i].x < -BoundingBox[i].w ) outOfBound[1]++;
		if ( BoundingBox[i].y >  BoundingBox[i].w ) outOfBound[2]++;
		if ( BoundingBox[i].y < -BoundingBox[i].w ) outOfBound[3]++;
		if ( BoundingBox[i].z >  BoundingBox[i].w ) outOfBound[4]++;
		if ( BoundingBox[i].z < -BoundingBox[i].w ) outOfBound[5]++;
	}

	bool inFrustum = true;
   
	for (int i=0; i<6; i++)
	{
		if ( outOfBound[i] == 8 ) 
		{
			inFrustum = false;
			break;
		}
	}

	return !inFrustum;
}

void main (void)
{
	//face center------------------------
	vec3 Vert1 = gl_in[0].gl_Position.xyz;
	vec3 Vert2 = gl_in[1].gl_Position.xyz;
	vec3 Vert3 = gl_in[2].gl_Position.xyz;

	vec3 Pos = (Vert1+Vert2+Vert3) / 3.0;   //Center of the triangle - copy for later

	/*if (distance(Pos.xyz, u_ViewOrigin.xyz) > 17384.0)
	{
		return;
	}*/

	// Do some ICR culling on the base surfaces... Save us looping through extra surfaces...
	vec3 maxs;
	maxs = max(gl_in[0].gl_Position.xyz - Pos, gl_in[1].gl_Position.xyz - Pos);
	maxs = max(maxs, gl_in[2].gl_Position.xyz - Pos);

	if (InstanceCloudReductionCulling(vec4(Pos, 0.0), maxs*2.0))
	{
		return;
	}

	// May as well create a real normal for the surface, since BSP sucks dog balls...
	//vec3 normal = normalize(cross(gl_in[2].gl_Position.xyz - gl_in[0].gl_Position.xyz, gl_in[1].gl_Position.xyz - gl_in[0].gl_Position.xyz));

	for(int i = 0; i < 3; i++) 
	{
		gl_Position				= u_ModelViewProjectionMatrix * gl_in[i].gl_Position;
		
		TexCoord_FS_in			= TexCoord_CS_in[i];
		//Normal_FS_in			= normal;//*Normal_CS_in[i];//(normal + Normal_CS_in[i]) / 2.0;//normal;//Normal_CS_in[i];
		Normal_FS_in			= Normal_CS_in[i];
		WorldPos_FS_in			= gl_in[i].gl_Position.xyz;//WorldPos_CS_in[i].xyz;

		ViewDir_FS_in			= ViewDir_CS_in[i];
		Color_FS_in				= Color_CS_in[i];
		Tangent_FS_in			= Tangent_CS_in[i];
		Bitangent_FS_in			= Bitangent_CS_in[i];
		PrimaryLightDir_FS_in	= -PrimaryLightDir_CS_in[i];
		TexCoord2_FS_in			= TexCoord2_CS_in[i];
		Blending_FS_in			= Blending_CS_in[i];
		Slope_FS_in				= Slope_CS_in[i];
		usingSteepMap_FS_in		= usingSteepMap_CS_in[i];

		EmitVertex();
	}
	
	EndPrimitive();
}

/*[TessControl]*/
// define the number of CPs in the output patch
#extension GL_ARB_tessellation_shader : enable

// PN patch data
struct PnPatch
{
 float b210;
 float b120;
 float b021;
 float b012;
 float b102;
 float b201;
 float b111;
 float n110;
 float n011;
 float n101;
};

// tessellation levels
uniform vec3			u_ViewOrigin;
uniform vec4			u_Local10;

#define gTessellationLevelInner u_Local10.g
#define gTessellationLevelOuter u_Local10.b

layout(vertices=3) out;

in vec4 WorldPos_CS_in[];
in vec3 Normal_CS_in[];
in vec2 TexCoord_CS_in[];
in vec4 Tangent_CS_in[];
in vec4 Bitangent_CS_in[];
in vec4 Color_CS_in[];
in vec4 PrimaryLightDir_CS_in[];
in vec2 TexCoord2_CS_in[];
in vec3 Blending_CS_in[];
in float Slope_CS_in[];
in float usingSteepMap_CS_in[];

out vec3 iNormal[3];
out vec2 iTexCoord[3];
out PnPatch iPnPatch[3];
out vec4 Tangent_ES_in[3];
out vec4 Bitangent_ES_in[3];
out vec4 Color_ES_in[3];
out vec4 PrimaryLightDir_ES_in[3];
out vec2 TexCoord2_ES_in[3];
out vec3 Blending_ES_in[3];
out float Slope_ES_in[3];
out float usingSteepMap_ES_in[3];

float GetTessLevel(float Distance0, float Distance1)
{
	return mix(1.0, gTessellationLevelInner, clamp(((Distance0 + Distance1) / 2.0) / 6.0, 0.0, 1.0));
}

float wij(int i, int j)
{
 return dot(gl_in[j].gl_Position.xyz - gl_in[i].gl_Position.xyz, Normal_CS_in[i]);
}

float vij(int i, int j)
{
 vec3 Pj_minus_Pi = gl_in[j].gl_Position.xyz
                  - gl_in[i].gl_Position.xyz;
 vec3 Ni_plus_Nj  = Normal_CS_in[i]+Normal_CS_in[j];
 return 2.0*dot(Pj_minus_Pi, Ni_plus_Nj)/dot(Pj_minus_Pi, Pj_minus_Pi);
}

void main()
{
 // get data
 gl_out[gl_InvocationID].gl_Position		= gl_in[gl_InvocationID].gl_Position;
 iNormal[gl_InvocationID]					= Normal_CS_in[gl_InvocationID];
 iTexCoord[gl_InvocationID]				= TexCoord_CS_in[gl_InvocationID];
 Color_ES_in[gl_InvocationID]				= Color_CS_in[gl_InvocationID];
 Tangent_ES_in[gl_InvocationID]			= Tangent_CS_in[gl_InvocationID];
 Bitangent_ES_in[gl_InvocationID]			= Bitangent_CS_in[gl_InvocationID];
 PrimaryLightDir_ES_in[gl_InvocationID]	= PrimaryLightDir_CS_in[gl_InvocationID];
 TexCoord2_ES_in[gl_InvocationID]			= TexCoord2_CS_in[gl_InvocationID];
 Blending_ES_in[gl_InvocationID]			= Blending_CS_in[gl_InvocationID];
 Slope_ES_in[gl_InvocationID]				= Slope_CS_in[gl_InvocationID];
 usingSteepMap_ES_in[gl_InvocationID]		= usingSteepMap_CS_in[gl_InvocationID];

 // set base 
 float P0 = gl_in[0].gl_Position[gl_InvocationID];
 float P1 = gl_in[1].gl_Position[gl_InvocationID];
 float P2 = gl_in[2].gl_Position[gl_InvocationID];
 float N0 = Normal_CS_in[0][gl_InvocationID];
 float N1 = Normal_CS_in[1][gl_InvocationID];
 float N2 = Normal_CS_in[2][gl_InvocationID];

 // compute control points
 iPnPatch[gl_InvocationID].b210 = (2.0*P0 + P1 - wij(0,1)*N0)/3.0;
 iPnPatch[gl_InvocationID].b120 = (2.0*P1 + P0 - wij(1,0)*N1)/3.0;
 iPnPatch[gl_InvocationID].b021 = (2.0*P1 + P2 - wij(1,2)*N1)/3.0;
 iPnPatch[gl_InvocationID].b012 = (2.0*P2 + P1 - wij(2,1)*N2)/3.0;
 iPnPatch[gl_InvocationID].b102 = (2.0*P2 + P0 - wij(2,0)*N2)/3.0;
 iPnPatch[gl_InvocationID].b201 = (2.0*P0 + P2 - wij(0,2)*N0)/3.0;
 float E = ( iPnPatch[gl_InvocationID].b210
           + iPnPatch[gl_InvocationID].b120
           + iPnPatch[gl_InvocationID].b021
           + iPnPatch[gl_InvocationID].b012
           + iPnPatch[gl_InvocationID].b102
           + iPnPatch[gl_InvocationID].b201 ) / 6.0;
 float V = (P0 + P1 + P2)/3.0;
 iPnPatch[gl_InvocationID].b111 = E + (E - V)*0.5;
 iPnPatch[gl_InvocationID].n110 = N0+N1-vij(0,1)*(P1-P0);
 iPnPatch[gl_InvocationID].n011 = N1+N2-vij(1,2)*(P2-P1);
 iPnPatch[gl_InvocationID].n101 = N2+N0-vij(2,0)*(P0-P2);

 	// set tess levels
	// Calculate the distance from the camera to the three control points
    float EyeToVertexDistance0 = distance(u_ViewOrigin.xyz, WorldPos_CS_in[0].xyz);
    float EyeToVertexDistance1 = distance(u_ViewOrigin.xyz, WorldPos_CS_in[1].xyz);
    float EyeToVertexDistance2 = distance(u_ViewOrigin.xyz, WorldPos_CS_in[2].xyz);

    // Calculate the tessellation levels
    gl_TessLevelOuter[0] = GetTessLevel(EyeToVertexDistance1, EyeToVertexDistance2);
    gl_TessLevelOuter[1] = GetTessLevel(EyeToVertexDistance2, EyeToVertexDistance0);
    gl_TessLevelOuter[2] = GetTessLevel(EyeToVertexDistance0, EyeToVertexDistance1);
    gl_TessLevelInner[0] = gl_TessLevelOuter[2];
}

/*[TessEvaluation]*/
#extension GL_ARB_tessellation_shader : enable

// PN patch data
struct PnPatch
{
 float b210;
 float b120;
 float b021;
 float b012;
 float b102;
 float b201;
 float b111;
 float n110;
 float n011;
 float n101;
};

uniform mat4 u_ModelViewProjectionMatrix; // mvp

uniform vec4 u_Local10;

#define uTessAlpha u_Local10.r

layout(triangles, fractional_odd_spacing, ccw) in;

uniform vec3			u_ViewOrigin;

in vec3 iNormal[];
in vec2 iTexCoord[];
in PnPatch iPnPatch[];
in vec4 Tangent_ES_in[];
in vec4 Bitangent_ES_in[];
in vec4 Color_ES_in[];
in vec4 PrimaryLightDir_ES_in[];
in vec2 TexCoord2_ES_in[];
in vec3 Blending_ES_in[];
in float Slope_ES_in[];
in float usingSteepMap_ES_in[];

out vec3 Normal_FS_in;
out vec2 TexCoord_FS_in;
out vec3 WorldPos_FS_in;
out vec3 ViewDir_FS_in;
out vec4 Tangent_FS_in;
out vec4 Bitangent_FS_in;
out vec4 Color_FS_in;
out vec4 PrimaryLightDir_FS_in;
out vec2 TexCoord2_FS_in;
out vec3 Blending_FS_in;
out float Slope_FS_in;
out float usingSteepMap_FS_in;

#define b300    gl_in[0].gl_Position.xyz
#define b030    gl_in[1].gl_Position.xyz
#define b003    gl_in[2].gl_Position.xyz
#define n200    iNormal[0]
#define n020    iNormal[1]
#define n002    iNormal[2]
#define uvw     gl_TessCoord

void main()
{
 vec3 uvwSquared = uvw*uvw;
 vec3 uvwCubed   = uvwSquared*uvw;

 // extract control points
 vec3 b210 = vec3(iPnPatch[0].b210, iPnPatch[1].b210, iPnPatch[2].b210);
 vec3 b120 = vec3(iPnPatch[0].b120, iPnPatch[1].b120, iPnPatch[2].b120);
 vec3 b021 = vec3(iPnPatch[0].b021, iPnPatch[1].b021, iPnPatch[2].b021);
 vec3 b012 = vec3(iPnPatch[0].b012, iPnPatch[1].b012, iPnPatch[2].b012);
 vec3 b102 = vec3(iPnPatch[0].b102, iPnPatch[1].b102, iPnPatch[2].b102);
 vec3 b201 = vec3(iPnPatch[0].b201, iPnPatch[1].b201, iPnPatch[2].b201);
 vec3 b111 = vec3(iPnPatch[0].b111, iPnPatch[1].b111, iPnPatch[2].b111);

 // extract control normals
 vec3 n110 = normalize(vec3(iPnPatch[0].n110,
                            iPnPatch[1].n110,
                            iPnPatch[2].n110));
 vec3 n011 = normalize(vec3(iPnPatch[0].n011,
                            iPnPatch[1].n011,
                            iPnPatch[2].n011));
 vec3 n101 = normalize(vec3(iPnPatch[0].n101,
                            iPnPatch[1].n101,
                            iPnPatch[2].n101));

 // compute texcoords
 TexCoord_FS_in  = gl_TessCoord[2]*iTexCoord[0]
            + gl_TessCoord[0]*iTexCoord[1]
            + gl_TessCoord[1]*iTexCoord[2];
 Tangent_FS_in = gl_TessCoord[2]*Tangent_ES_in[0]
            + gl_TessCoord[0]*Tangent_ES_in[1]
            + gl_TessCoord[1]*Tangent_ES_in[2];
 Bitangent_FS_in = gl_TessCoord[2]*Bitangent_ES_in[0]
            + gl_TessCoord[0]*Bitangent_ES_in[1]
            + gl_TessCoord[1]*Bitangent_ES_in[2];
 Color_FS_in = gl_TessCoord[2]*Color_ES_in[0]
            + gl_TessCoord[0]*Color_ES_in[1]
            + gl_TessCoord[1]*Color_ES_in[2];
 PrimaryLightDir_FS_in = gl_TessCoord[2]*PrimaryLightDir_ES_in[0]
            + gl_TessCoord[0]*PrimaryLightDir_ES_in[1]
            + gl_TessCoord[1]*PrimaryLightDir_ES_in[2];
 TexCoord2_FS_in = gl_TessCoord[2]*TexCoord2_ES_in[0]
            + gl_TessCoord[0]*TexCoord2_ES_in[1]
            + gl_TessCoord[1]*TexCoord2_ES_in[2];
 Blending_FS_in = gl_TessCoord[2]*Blending_ES_in[0]
            + gl_TessCoord[0]*Blending_ES_in[1]
            + gl_TessCoord[1]*Blending_ES_in[2];
 Slope_FS_in = gl_TessCoord[2]*Slope_ES_in[0]
            + gl_TessCoord[0]*Slope_ES_in[1]
            + gl_TessCoord[1]*Slope_ES_in[2];
 usingSteepMap_FS_in = gl_TessCoord[2]*usingSteepMap_ES_in[0]
            + gl_TessCoord[0]*usingSteepMap_ES_in[1]
            + gl_TessCoord[1]*usingSteepMap_ES_in[2];

 // normal
 vec3 barNormal = gl_TessCoord[2]*iNormal[0]
                + gl_TessCoord[0]*iNormal[1]
                + gl_TessCoord[1]*iNormal[2];
 vec3 pnNormal  = n200*uvwSquared[2]
                + n020*uvwSquared[0]
                + n002*uvwSquared[1]
                + n110*uvw[2]*uvw[0]
                + n011*uvw[0]*uvw[1]
                + n101*uvw[2]*uvw[1];
 Normal_FS_in = uTessAlpha*pnNormal + (1.0-uTessAlpha)*barNormal;

 // compute interpolated pos
 vec3 barPos = gl_TessCoord[2]*b300
             + gl_TessCoord[0]*b030
             + gl_TessCoord[1]*b003;

 // save some computations
 uvwSquared *= 3.0;

 // compute PN position
 vec3 pnPos  = b300*uvwCubed[2]
             + b030*uvwCubed[0]
             + b003*uvwCubed[1]
             + b210*uvwSquared[2]*uvw[0]
             + b120*uvwSquared[0]*uvw[2]
             + b201*uvwSquared[2]*uvw[1]
             + b021*uvwSquared[0]*uvw[1]
             + b102*uvwSquared[1]*uvw[2]
             + b012*uvwSquared[1]*uvw[0]
             + b111*6.0*uvw[0]*uvw[1]*uvw[2];

 // final position and normal
 vec3 finalPos = (1.0-uTessAlpha)*barPos + uTessAlpha*pnPos;
 gl_Position   = u_ModelViewProjectionMatrix * vec4(finalPos,1.0);
 WorldPos_FS_in = finalPos.xyz;
 ViewDir_FS_in = u_ViewOrigin - finalPos;
}
