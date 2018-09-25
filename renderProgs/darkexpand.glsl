/*[Vertex]*/
attribute vec3 attr_Position;
attribute vec4 attr_TexCoord0;

uniform mat4   u_ModelViewProjectionMatrix;

uniform vec2	u_Dimensions;

varying vec2   var_TexCoords;
varying vec2   var_Dimensions;

void main()
{
	gl_Position = u_ModelViewProjectionMatrix * vec4(attr_Position, 1.0);
	var_TexCoords = attr_TexCoord0.st;
	var_Dimensions = u_Dimensions.st;
}

/*[Fragment]*/
//
// Cleans textures, expands depth, improves distant objects, and fixes the transparancy and bright edges bugs... In short, makes *everything* look better!
//

uniform sampler2D	u_TextureMap;
uniform vec2		u_Dimensions;

varying vec2		var_TexCoords;
varying vec2		var_Dimensions;

float viewWidth =	var_Dimensions.x;
float viewHeight =	var_Dimensions.y;

const float scale = 1.0;
const float thresh = 0.93;

void main()
{
    vec4 sum = vec4(0.0);
    int x=0;
    int y=0;

    vec2 recipres = vec2(1.0f / viewWidth, 1.0f / viewHeight);

	for(y=-1; y<=1; y++)
	{
		for(x=-1; x<=1; x++) sum+=texture2D(u_TextureMap, var_TexCoords + (vec2(x,y) * recipres));
	}

    sum/=(3*3);

    vec4 s = texture2D(u_TextureMap, var_TexCoords);
    gl_FragColor = s;

#ifdef BLUR_METHOD
	//
	// This version uses the blured color, which can also blur distant objects... Looks a little like dof in some ways...
	//

    vec4 out_color = sum*scale;

    // use the blurred colour if it's darker
    if ((sum.r + sum.g + sum.b) * 0.333 < ((s.r + s.g + s.b) * 0.333) * thresh)
    {
        //gl_FragColor = (out_color + s) / 2.0;
		//gl_FragColor = (out_color + out_color + out_color + s) / 4.0;
		gl_FragColor = out_color;
    }
#else //!BLUR_METHOD
	//
	// This version instead calculates the brightness difference and subtracts from original color (so no distant screen blur)...
	//

	// use the diff between this color and the blurred colour if the blurred color is darker
    if ((sum.r + sum.g + sum.b) * 0.333 < ((s.r + s.g + s.b) * 0.333) * thresh)
    {
		float diff = ((s.r + s.g + s.b) - (sum.r + sum.g + sum.b)) * 0.33333;
		gl_FragColor = s*scale;
		gl_FragColor -= vec4(diff);
    }
#endif //BLUR_METHOD

	//gl_FragColor.a = origColor.a;
	//gl_FragColor.a = s.a;
	gl_FragColor.a = 1.0;
}
