/*[Vertex]*/
attribute vec3 attr_Position;
attribute vec4 attr_TexCoord0;

uniform mat4   u_ModelViewProjectionMatrix;
varying vec2   var_TexCoords;

void main()
{
	gl_Position = u_ModelViewProjectionMatrix * vec4(attr_Position, 1.0);
	var_TexCoords = attr_TexCoord0.st;
}

/*[Fragment]*/
uniform sampler2D u_TextureMap;
uniform float     u_Brightness;
uniform float     u_Contrast;
uniform float     u_Gamma;

varying vec2      var_TexCoords;

void main()
{
	gl_FragColor = texture2D(u_TextureMap, var_TexCoords);
	gl_FragColor.rgb = clamp(((gl_FragColor.rgb - 0.5f) * max(u_Contrast, 0)) + 0.5f, 0.0, 1.0);
	gl_FragColor.rgb = clamp(gl_FragColor.rgb + u_Brightness, 0.0, 1.0);
	gl_FragColor.rgb = clamp(pow(gl_FragColor.rgb, vec3(1.0/u_Gamma)), 0.0, 1.0);
}
