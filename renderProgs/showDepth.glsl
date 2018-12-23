/*[Vertex]*/
attribute vec3	attr_Position;
attribute vec2	attr_TexCoord0;

uniform mat4	u_ModelViewProjectionMatrix;

varying vec2   	var_TexCoords;

void main()
{
	gl_Position = u_ModelViewProjectionMatrix * vec4(attr_Position, 1.0);
	var_TexCoords = attr_TexCoord0.st;
}

/*[Fragment]*/
uniform sampler2D	u_DiffuseMap;
uniform sampler2D	u_ScreenDepthMap;

uniform vec4		u_ViewInfo; // zmin, zmax, zmax / zmin

varying vec2		var_TexCoords;

float linearize(float depth)
{
	return 1.0 / mix(u_ViewInfo.z, 1.0, depth);
}

void main(void)
{
	float depth = linearize(texture(u_ScreenDepthMap, var_TexCoords).r);
	gl_FragColor = vec4(depth, depth, depth, 1.0);
}
