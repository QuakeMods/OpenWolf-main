/*[Vertex]*/
attribute vec3	attr_Position;
attribute vec4	attr_TexCoord0;

uniform mat4	u_ModelViewProjectionMatrix;

varying vec2	var_ScreenTex;

void main()
{
	gl_Position = u_ModelViewProjectionMatrix * vec4(attr_Position, 1.0);
	var_ScreenTex = attr_TexCoord0.xy;
}

/*[Fragment]*/
uniform sampler2D	u_DiffuseMap;
uniform sampler2D	u_NormalMap;

uniform vec2		u_Dimensions;

varying vec2		var_ScreenTex;

// Shall we blur the result?
#define BLUR_STEP 2.0
#define BLUR_WIDTH 12.0

void main()
{
	vec4 diffuseColor = textureLod(u_DiffuseMap, var_ScreenTex, 0.0);
	vec2 offset = vec2(1.0) / u_Dimensions;
	vec3 volumeLight = vec3(0.0);
	float numAdded = 0.0;
	
	for (float x = -BLUR_WIDTH; x <= BLUR_WIDTH; x += BLUR_STEP)
	{
		for (float y = -BLUR_WIDTH; y <= BLUR_WIDTH; y += BLUR_STEP)
		{
			volumeLight += textureLod(u_NormalMap, var_ScreenTex + (offset * vec2(x, y)), 0.0).rgb;
			numAdded += 1.0;
		}
	}

	volumeLight /= numAdded;

	gl_FragColor = vec4(diffuseColor.rgb + volumeLight, 1.0);
}
