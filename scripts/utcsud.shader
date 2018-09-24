//UTCSUD13-SHADER-SRC-FILE (c) Matth ,2016

//LIGHTS
textures/utcsud/utcsud_03
{
	q3map_lightimage textures/utcsud/utcsud_03_blend.jpg
	q3map_surfacelight 2000
	q3map_lightmapFilterRadius 0 16
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/utcsud/utcsud_03.jpg
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/utcsud/utcsud_03_blend.jpg
		blendfunc GL_ONE GL_ONE
	}
}
textures/utcsud/utcsud_03_blend_red
{
	q3map_lightimage textures/utcsud/utcsud_03_blend_red.jpg
	q3map_surfaceLight	4000
	q3map_lightmapFilterRadius 0 16
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/utcsud/utcsud_03r.jpg
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/utcsud/utcsud_03_blend_red.jpg
		blendfunc GL_ONE GL_ONE
	}
}
textures/utcsud/utcsud_03_blend_blue
{
	q3map_lightimage textures/utcsud/utcsud_03_blend_blue.jpg
	q3map_surfacelight 4000
	q3map_lightmapFilterRadius 0 16
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/utcsud/utcsud_03b.jpg
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/utcsud/utcsud_03_blend_blue.jpg
		blendfunc GL_ONE GL_ONE
	}
}
textures/utcsud/utcsud_20
{
	q3map_lightimage textures/utcsud/utcsud_20_blend.jpg
	q3map_surfaceLight 4000
	q3map_lightmapFilterRadius 0 16
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/utcsud/utcsud_20.jpg
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/utcsud/utcsud_20_blend.jpg
		blendfunc GL_ONE GL_ONE
	}
}

//MISC
textures/utcsud/wasser
{
		qer_editorimage textures/utcsud/wasser.jpg
		qer_trans .5
		q3map_lightimage textures/utcsud/wasser.jpg
		q3map_globaltexture
		q3map_lightmapFilterRadius 0 16
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		cull disable
		deformVertexes wave 64 sin .25 .25 0 .5
		{
				map textures/utcsud/wasser.jpg
				blendFunc GL_DST_COLOR GL_ONE
				rgbgen identity
				tcmod scale .5 .5
				tcmod scroll .02 0.1
		}
		{
				map textures/utcsud/wasser.jpg
				blendFunc GL_DST_COLOR GL_ONE
				tcmod scale -.5 -.5
				tcmod scroll .025 .025
		}
}
textures/utcsud/credits
{
	q3map_lightimage textures/utcsud/credits.jpg
	q3map_surfaceLight	1000
	q3map_lightmapFilterRadius 0 16
	surfaceparm nobuild
	surfaceparm noimpact	
	surfaceparm nomarks
	surfaceparm slick
	surfaceparm nonsolid
	{
		map textures/utcsud/credits.jpg
	}
	{
		map textures/utcsud/credits_add.jpg
		blendfunc GL_ONE GL_ONE
		rgbGen wave noise 0.75 0.5 0 10
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
		depthFunc equal
	}
}
textures/utcsud/sky
{
	qer_editorimage env/utcsud/ud_bk
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	nopicmip
	nomipmaps
	q3map_skylight 350 3
	q3map_lightimage env/utcsud/ud_bk
	q3map_bounceScale 4.0
	q3map_lightmapFilterRadius 0 8
	skyparms env/utcsud/ud - -
}
textures/utcsud/vent_01
{
	qer_editorimage textures/utcsud/vent_01
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm detail
	surfaceparm alphashadow
	{
		map textures/utcsud/vent_01.tga
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
		depthFunc equal
	}
}
