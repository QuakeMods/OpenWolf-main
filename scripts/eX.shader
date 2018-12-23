// written for ioquake3/renderergl2 by mega, aka odin
// original by evillair
textures/eX/eX_lightpanel_01_lit
{
	qer_editorimage	textures/eX/eX_lightpanel_01_d
	{
		map textures/eX/eX_lightpanel_01_d
	}
	{
		map $lightmap
		blendfunc filter
	}
	{
		map textures/eX/eX_lightpanel_01_add
		blendfunc add
	}
}

textures/eX/eX_light_u201_lit
{
	qer_editorimage	textures/eX/eX_light_u201_d
	{
		map textures/eX/eX_light_u201_d
	}
	{
		map $lightmap
		blendfunc filter
	}
	{
		map textures/eX/eX_light_u201_add
		blendfunc add
	}
}

textures/eX/eX_lightpanel_01_lit_1000
{
	qer_editorimage	textures/eX/eX_lightpanel_01_d
	q3map_surfacelight 1000
	q3map_lightimage textures/eX/eX_lightpanel_01_add
	{
		map textures/eX/eX_lightpanel_01_d
	}
	{
		map $lightmap
		blendfunc filter
	}
	{
		map textures/eX/eX_lightpanel_01_add
		blendfunc add
	}
}

textures/eX/eX_light_u201_lit_1000
{
	qer_editorimage	textures/eX/eX_light_u201_d
	q3map_surfacelight 1000
	q3map_lightimage textures/eX/eX_light_u201_add
	{
		map textures/eX/eX_light_u201_d
	}
	{
		map $lightmap
		blendfunc filter
	}
	{
		map textures/eX/eX_light_u201_add
		blendfunc add
	}
}

textures/eX/eX_floor_grate03_d
{
	qer_editorimage textures/eX/eX_floor_grate03_d
	surfaceparm metalsteps
	{
		map textures/eX/eX_floor_grate03_d
	}
	{
		map $lightmap
		blendfunc filter
	}
}

textures/eX/eX_floor_grate03_trans
{
	qer_editorimage textures/eX/eX_floor_grate03_d
	surfaceparm alphashadow
	surfaceparm metalsteps
	cull none
	{
		map textures/eX/eX_floor_grate03_d
		alphafunc ge128
		depthwrite
	}
	{
		map $lightmap
		depthfunc equal
		blendfunc filter
	}
}

textures/eX/eX_floor_grate_03_128_d
{
	qer_editorimage textures/eX/eX_floor_grate_03_128_d
	surfaceparm metalsteps
	{
		map textures/eX/eX_floor_grate_03_128_d
	}
	{
		map $lightmap
		blendfunc filter
	}
}

textures/eX/eX_floor_grate_03_128_trans
{
	qer_editorimage textures/eX/eX_floor_grate_03_128_d
	surfaceparm alphashadow
	surfaceparm metalsteps
	cull none
	{
		map textures/eX/eX_floor_grate_03_128_d
		alphafunc ge128
		depthwrite
	}
	{
		map $lightmap
		depthfunc equal
		blendfunc filter
	}
}

textures/eX/eX_floor_grate_03_d
{
	qer_editorimage textures/eX/eX_floor_grate_03_d
	surfaceparm metalsteps
	{
		map textures/eX/eX_floor_grate_03_d
	}
	{
		map $lightmap
		blendfunc filter
	}
}

textures/eX/eX_floor_grate_03_trans
{
	qer_editorimage textures/eX/eX_floor_grate_03_d
	surfaceparm alphashadow
	surfaceparm metalsteps
	cull none
	{
		map textures/eX/eX_floor_grate_03_d
		alphafunc ge128
		depthwrite
	}
	{
		map $lightmap
		depthfunc equal
		blendfunc filter
	}
}

textures/eX/eX_floor_mtl_grate_01_d
{
	qer_editorimage textures/eX/eX_floor_mtl_grate_01_d
	surfaceparm metalsteps
	{
		map textures/eX/eX_floor_mtl_grate_01_d
	}
	{
		map $lightmap
		blendfunc filter
	}
}

textures/eX/eX_floor_mtl_grate_01_trans
{
	qer_editorimage textures/eX/eX_floor_mtl_grate_01_d
	surfaceparm alphashadow
	surfaceparm metalsteps
	cull none
	{
		map textures/eX/eX_floor_mtl_grate_01_d
		alphafunc ge128
		depthwrite
	}
	{
		map $lightmap
		depthfunc equal
		blendfunc filter
	}
}

// written for ioquake3/renderergl2 by mega, aka odin
// original by evillair
textures/eX/eX_clangfloor_01_d
{
	qer_editorimage textures/eX/eX_clangfloor_01_d
	{
		stage diffuseMap
		map textures/eX/eX_clangfloor_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_clangfloor_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_clangfloor_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_clangfloor_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/eX/eX_clangfloor_01b_d
{
	qer_editorimage	textures/eX/eX_clangfloor_01b_d
	{
		stage diffuseMap
		map textures/eX/eX_clangfloor_01b_d
	}
	{
		stage normalMap
		map textures/eX/eX_clangfloor_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_clangfloor_01_norm
		parallaxdepth 100
	}
	{
		stage specularMap
		map textures/eX/eX_clangfloor_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretebase_01_d
{
	qer_editorimage	textures/eX/eX_cretebase_01_d
	{
		stage diffuseMap
		map textures/eX/eX_cretebase_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretebase_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretebase_01_norm
		parallaxdepth 100
	}
	{
		stage specularMap
		map textures/eX/eX_cretebase_01_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretebase_02_d
{
	qer_editorimage	textures/eX/eX_cretebase_02_d
	{
		stage diffuseMap
		map textures/eX/eX_cretebase_02_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretebase_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretebase_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_cretebase_01_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretebase_03_dark_d
{
	qer_editorimage	textures/eX/eX_cretebase_03_dark_d
	{
		stage diffuseMap
		map textures/eX/eX_cretebase_03_dark_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretebase_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretebase_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_cretebase_01_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretefloor_01_d
{
	qer_editorimage	textures/eX/eX_cretefloor_01_d
	{
		stage diffuseMap
		map textures/eX/eX_cretefloor_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretefloor_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretefloor_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_cretefloor_01_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretefloor_01b_d
{
	qer_editorimage	textures/eX/eX_cretefloor_01b_d
	{
		stage diffuseMap
		map textures/eX/eX_cretefloor_01b_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretefloor_01b_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretefloor_01b_norm
	}
	{
		stage specularMap
		map textures/eX/eX_cretefloor_01b_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretewall_01_d
{
	qer_editorimage	textures/eX/eX_cretewall_01_d
	{
		stage diffuseMap
		map textures/eX/eX_cretewall_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretewall_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretewall_01_d_norm
	}
	{
		stage specularMap
		map textures/eX/eX_cretewall_01_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretewall_02_d
{
	qer_editorimage	textures/eX/eX_cretewall_02_d
	{
		stage diffuseMap
		map textures/eX/eX_cretewall_02_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretewall_02_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretewall_02_norm
	}
	{
		stage specularMap
		map textures/eX/eX_cretewall_02_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretewall_03_d
{
	qer_editorimage	textures/eX/eX_cretewall_03_d
	{
		stage diffuseMap
		map textures/eX/eX_cretewall_03_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretewall_03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretewall_03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_cretewall_03_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretewall_03b_d
{
	qer_editorimage	textures/eX/eX_cretewall_03b_d
	{
		stage diffuseMap
		map textures/eX/eX_cretewall_03b_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretewall_03b_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretewall_03b_norm
	}
	{
		stage specularMap
		map textures/eX/eX_cretewall_03b_s
		specularreflectance 0
		specularexponent 64
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_deswall_01_d
{
	qer_editorimage	textures/eX/eX_deswall_01_d
	{
		stage diffuseMap
		map textures/eX/eX_deswall_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_deswall_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_deswall_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_deswall_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate03_d
{
	qer_editorimage	textures/eX/eX_floor_grate03_d
	surfaceparm metalsteps
	{
		stage diffuseMap
		map textures/eX/eX_floor_grate03_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_grate03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_grate03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_grate03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate03_trans
{
	qer_editorimage	textures/eX/eX_floor_grate03_d
	surfaceparm metalsteps
	cull none
	{
		stage diffuseMap
		map textures/eX/eX_floor_grate03_d
		alphafunc ge128
		depthwrite
	}
	{
		stage normalMap
		map textures/eX/eX_floor_grate03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_grate03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_grate03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		depthfunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate_03_128_d
{
	qer_editorimage	textures/eX/eX_floor_grate_03_128_d
	surfaceparm metalsteps
	{
		stage diffuseMap
		map textures/eX/eX_floor_grate_03_128_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_grate_03_128_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_grate_03_128_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_grate_03_128_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate_03_128_trans
{
	qer_editorimage	textures/eX/eX_floor_grate_03_128_d
	surfaceparm metalsteps
	cull none
	{
		stage diffuseMap
		map textures/eX/eX_floor_grate_03_128_d
		alphafunc ge128
		depthwrite
	}
	{
		stage normalMap
		map textures/eX/eX_floor_grate_03_128_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_grate_03_128_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_grate_03_128_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		depthfunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate_03_d
{
	qer_editorimage	textures/eX/eX_floor_grate_03_d
	surfaceparm metalsteps
	{
		stage diffuseMap
		map textures/eX/eX_floor_grate_03_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_grate_03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_grate_03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_grate_03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate_03_trans
{
	qer_editorimage	textures/eX/eX_floor_grate_03_d
	surfaceparm metalsteps
	cull none
	{
		stage diffuseMap
		map textures/eX/eX_floor_grate_03_d
		alphafunc ge128
		depthwrite
	}
	{
		stage normalMap
		map textures/eX/eX_floor_grate_03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_grate_03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_grate_03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		depthfunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_mtl_grate_01_d
{
	qer_editorimage	textures/eX/eX_floor_mtl_grate_01_d
	surfaceparm metalsteps
	{
		stage diffuseMap
		map textures/eX/eX_floor_mtl_grate_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_mtl_grate_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_mtl_grate_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_mtl_grate_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_mtl_grate_01_trans
{
	qer_editorimage	textures/eX/eX_floor_mtl_grate_01_d
	surfaceparm metalsteps
	cull none
	{
		stage diffuseMap
		map textures/eX/eX_floor_mtl_grate_01_d
		alphafunc ge128
		depthwrite
	}
	{
		stage normalMap
		map textures/eX/eX_floor_mtl_grate_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_mtl_grate_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_mtl_grate_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		depthfunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_mtl_wrn_01_d
{
	qer_editorimage	textures/eX/eX_floor_mtl_wrn_01_d
	{
		stage diffuseMap
		map textures/eX/eX_floor_mtl_wrn_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_mtl_wrn_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_mtl_wrn_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_mtl_wrn_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_simple_05_d
{
	qer_editorimage	textures/eX/eX_floor_simple_05_d
	{
		stage diffuseMap
		map textures/eX/eX_floor_simple_05_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_simple_05_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_simple_05_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_simple_05_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_simplines_d
{
	qer_editorimage	textures/eX/eX_floor_simplines_d
	{
		stage diffuseMap
		map textures/eX/eX_floor_simplines_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_simplines_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_simplines_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_simplines_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_tile_03_d
{
	qer_editorimage	textures/eX/eX_floor_tile_03_d
	{
		stage diffuseMap
		map textures/eX/eX_floor_tile_03_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_tile_03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_tile_03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_tile_03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_tread_01_d
{
	qer_editorimage	textures/eX/eX_floor_tread_01_d
	{
		stage diffuseMap
		map textures/eX/eX_floor_tread_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_floor_tread_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floor_tread_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floor_tread_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floorpanel_01_d
{
	qer_editorimage	textures/eX/eX_floorpanel_01_d
	{
		stage diffuseMap
		map textures/eX/eX_floorpanel_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_floorpanel_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_floorpanel_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_floorpanel_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_metalplate_01_d
{
	qer_editorimage	textures/eX/eX_metalplate_01_d
	{
		stage diffuseMap
		map textures/eX/eX_metalplate_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_metalplate_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_metalplate_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_metalplate_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_metalSupp01_d
{
	qer_editorimage	textures/eX/eX_metalSupp01_d
	{
		stage diffuseMap
		map textures/eX/eX_metalSupp01_d
	}
	{
		stage normalMap
		map textures/eX/eX_metalSupp01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_metalSupp01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_metalSupp01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_metalwall02_d
{
	qer_editorimage	textures/eX/eX_metalwall02_d
	{
		stage diffuseMap
		map textures/eX/eX_metalwall02_d
	}
	{
		stage normalMap
		map textures/eX/eX_metalwall02_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_metalwall02_norm
	}
	{
		stage specularMap
		map textures/eX/eX_metalwall02_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_bigplate_04_d
{
	qer_editorimage	textures/eX/eX_mtl_bigplate_04_d
	{
		stage diffuseMap
		map textures/eX/eX_mtl_bigplate_04_d
	}
	{
		stage normalMap
		map textures/eX/eX_mtl_bigplate_04_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_mtl_bigplate_04_norm
	}
	{
		stage specularMap
		map textures/eX/eX_mtl_bigplate_04_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_bigplate_04b_d
{
	qer_editorimage	textures/eX/eX_mtl_bigplate_04b_d
	{
		stage diffuseMap
		map textures/eX/eX_mtl_bigplate_04b_d
	}
	{
		stage normalMap
		map textures/eX/eX_mtl_bigplate_04b_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_mtl_bigplate_04b_norm
	}
	{
		stage specularMap
		map textures/eX/eX_mtl_bigplate_04b_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_panel_02_d
{
	qer_editorimage	textures/eX/eX_mtl_panel_02_d
	{
		stage diffuseMap
		map textures/eX/eX_mtl_panel_02_d
	}
	{
		stage normalMap
		map textures/eX/eX_mtl_panel_02_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_mtl_panel_02_norm
	}
	{
		stage specularMap
		map textures/eX/eX_mtl_panel_02_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_panel_03_d
{
	qer_editorimage	textures/eX/eX_mtl_panel_03_d
	{
		stage diffuseMap
		map textures/eX/eX_mtl_panel_03_d
	}
	{
		stage normalMap
		map textures/eX/eX_mtl_panel_03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_mtl_panel_03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_mtl_panel_03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_panel_04_d
{
	qer_editorimage	textures/eX/eX_mtl_panel_04_d
	{
		stage diffuseMap
		map textures/eX/eX_mtl_panel_04_d
	}
	{
		stage normalMap
		map textures/eX/eX_mtl_panel_04_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_mtl_panel_04_norm
	}
	{
		stage specularMap
		map textures/eX/eX_mtl_panel_04_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01_d
{
	qer_editorimage	textures/eX/eX_q2_01_d
	{
		stage diffuseMap
		map textures/eX/eX_q2_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_q2_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_q2_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_q2_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01b_d
{
	qer_editorimage	textures/eX/eX_q2_01b_d
	{
		stage diffuseMap
		map textures/eX/eX_q2_01b_d
	}
	{
		stage normalMap
		map textures/eX/eX_q2_01b_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_q2_01b_norm
	}
	{
		stage specularMap
		map textures/eX/eX_q2_01b_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01c_d
{
	qer_editorimage	textures/eX/eX_q2_01c_d
	{
		stage diffuseMap
		map textures/eX/eX_q2_01c_d
	}
	{
		stage normalMap
		map textures/eX/eX_q2_01c_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_q2_01c_norm
	}
	{
		stage specularMap
		map textures/eX/eX_q2_01c_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01d_d
{
	qer_editorimage	textures/eX/eX_q2_01d_d
	{
		stage diffuseMap
		map textures/eX/eX_q2_01d_d
	}
	{
		stage normalMap
		map textures/eX/eX_q2_01d_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_q2_01d_norm
	}
	{
		stage specularMap
		map textures/eX/eX_q2_01d_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01e_d
{
	qer_editorimage	textures/eX/eX_q2_01e_d
	{
		stage diffuseMap
		map textures/eX/eX_q2_01e_d
	}
	{
		stage normalMap
		map textures/eX/eX_q2_01e_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_q2_01e_norm
	}
	{
		stage specularMap
		map textures/eX/eX_q2_01e_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_rndfloor_01_d
{
	qer_editorimage	textures/eX/eX_rndfloor_01_d
	{
		stage diffuseMap
		map textures/eX/eX_rndfloor_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_rndfloor_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_rndfloor_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_rndfloor_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_rndfloor_02_d
{
	qer_editorimage	textures/eX/eX_rndfloor_02_d
	{
		stage diffuseMap
		map textures/eX/eX_rndfloor_02_d
	}
	{
		stage normalMap
		map textures/eX/eX_rndfloor_02_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_rndfloor_02_norm
	}
	{
		stage specularMap
		map textures/eX/eX_rndfloor_02_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_rplates_01_d
{
	qer_editorimage	textures/eX/eX_rplates_01_d
	{
		stage diffuseMap
		map textures/eX/eX_rplates_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_rplates_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_rplates_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_rplates_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_steptop_01_d
{
	qer_editorimage	textures/eX/eX_steptop_01_d
	{
		stage diffuseMap
		map textures/eX/eX_steptop_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_steptop_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_steptop_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_steptop_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_01_d
{
	qer_editorimage	textures/eX/eX_trim_01_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_baseboard_02_d
{
	qer_editorimage	textures/eX/eX_trim_baseboard_02_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_baseboard_02_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_baseboard_02_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_baseboard_02_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_baseboard_02_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_baseboard_03_d
{
	qer_editorimage	textures/eX/eX_trim_baseboard_03_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_baseboard_03_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_baseboard_03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_baseboard_03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_baseboard_03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_baseboard_d
{
	qer_editorimage	textures/eX/eX_trim_baseboard_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_baseboard_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_baseboard_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_baseboard_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_baseboard_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_psimple_04_d
{
	qer_editorimage	textures/eX/eX_trim_psimple_04_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_psimple_04_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_psimple_04_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_psimple_04_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_psimple_04_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_psimple_05_d
{
	qer_editorimage	textures/eX/eX_trim_psimple_05_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_psimple_05_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_psimple_05_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_psimple_05_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_psimple_05_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_simple03_d
{
	qer_editorimage	textures/eX/eX_trim_simple03_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_simple03_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_simple03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_simple03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_simple03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_simple_01_d
{
	qer_editorimage	textures/eX/eX_trim_simple_01_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_simple_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_simple_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_simple_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_simple_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_support_03_d
{
	qer_editorimage	textures/eX/eX_trim_support_03_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_support_03_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_support_03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_support_03_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_support_03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_vert_01_d
{
	qer_editorimage	textures/eX/eX_trim_vert_01_d
	{
		stage diffuseMap
		map textures/eX/eX_trim_vert_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_trim_vert_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_trim_vert_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_trim_vert_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_01_d
{
	qer_editorimage	textures/eX/eX_wall_01_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_01_local
	}
	{
		stage specularMap
		map textures/eX/eX_wall_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_01b_d
{
	qer_editorimage	textures/eX/eX_wall_01b_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_01b_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_wall_01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_wall_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_b01_d
{
	qer_editorimage	textures/eX/eX_wall_b01_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_b01_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_b01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_wall_b01_norm
	}
	{
		stage specularMap
		map textures/eX/eX_wall_b01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_bigrib_02_d
{
	qer_editorimage	textures/eX/eX_wall_bigrib_02_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_bigrib_02_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_bigrib_02_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_wall_bigrib_02_norm
	}
	{
		stage specularMap
		map textures/eX/eX_wall_bigrib_02_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_bplate_06_d
{
	qer_editorimage	textures/eX/eX_wall_bplate_06_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_bplate_06_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_bplate_06_local
	}
	//{
	//	stage normalParallaxMap
	//	map textures/eX/eX_wall_panels_06_norm
	//}
	{
		stage specularMap
		map textures/eX/eX_wall_bplate_06_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_panel_05_d
{
	qer_editorimage	textures/eX/eX_wall_panel_05_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_panel_05_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_panel_05_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_wall_panel_05_norm
	}
	{
		stage specularMap
		map textures/eX/eX_wall_panel_05_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_panels_08_d
{
	qer_editorimage	textures/eX/eX_wall_panels_08_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_panels_08_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_panels_08_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_wall_panels_08_norm
	}	
	{
		stage specularMap
		map textures/eX/eX_wall_panels_08_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_panels_08b_d
{
	qer_editorimage	textures/eX/eX_wall_panels_08b_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_panels_08b_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_panels_08b_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_wall_panels_08b_norm
	}
	{
		stage specularMap
		map textures/eX/eX_wall_panels_08b_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_pipe_d
{
	qer_editorimage	textures/eX/eX_wall_pipe_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_pipe_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_pipe_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_wall_pipe_norm
	}
	{
		stage specularMap
		map textures/eX/eX_wall_pipe_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_u207_d
{
	qer_editorimage	textures/eX/eX_wall_u207_d
	{
		stage diffuseMap
		map textures/eX/eX_wall_u207_d
	}
	{
		stage normalMap
		map textures/eX/eX_wall_u207_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_wall_u207_norm
	}
	{
		stage specularMap
		map textures/eX/eX_wall_u207_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetal_plate01_d
{
	qer_editorimage	textures/eX/eXmetal_plate01_d
	{
		stage diffuseMap
		map textures/eX/eXmetal_plate01_d
	}
	{
		stage normalMap
		map textures/eX/eXmetal_plate01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetal_plate01_normal
	}
	{
		stage specularMap
		map textures/eX/eXmetal_plate01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetal_plate01B_d
{
	qer_editorimage	textures/eX/eXmetal_plate01B_d
	{
		stage diffuseMap
		map textures/eX/eXmetal_plate01B_d
	}
	{
		stage normalMap
		map textures/eX/eX_cretebase_01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetal_plate01_norm
	}
	{
		stage specularMap
		map textures/eX/eXmetal_plate01B_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetal_plate01c_d
{
	qer_editorimage	textures/eX/eXmetal_plate01c_d
	{
		stage diffuseMap
		map textures/eX/eXmetal_plate01c_d
	}
	{
		stage normalMap
		map textures/eX/eXmetal_plate01c_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetal_plate01c_norm
	}
	{
		stage specularMap
		map textures/eX/eXmetal_plate01c_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase01_d
{
	qer_editorimage	textures/eX/eXmetalBase01_d
	{
		stage diffuseMap
		map textures/eX/eXmetalBase01_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalBase01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetalBase01_norm
	}
	{
		stage specularMap
		map textures/eX/eXmetalBase01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase02_d
{
	qer_editorimage	textures/eX/eXmetalBase02_d
	{
		stage diffuseMap
		map textures/eX/eXmetalBase02_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalBase02_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetalBase02_norm
	}
	{
		stage specularMap
		map textures/eX/eXmetalBase02_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase03_d
{
	qer_editorimage	textures/eX/eXmetalBase03_d
	{
		stage diffuseMap
		map textures/eX/eXmetalBase03_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalBase03_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetalBase03_norm
	}
	{
		stage specularMap
		map textures/eX/eXmetalBase03_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase04
{
	qer_editorimage	textures/eX/eXmetalBase04_d
	{
		stage diffuseMap
		map textures/eX/eXmetalBase04_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalBase04_local
	}
	{
		stage specularMap
		map textures/eX/eXmetalBase04_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase05Rust_d
{
	qer_editorimage	textures/eX/eXmetalBase05Rust_d
	{
		stage diffuseMap
		map textures/eX/eXmetalBase05Rust_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalBase05Rust_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetalBase05Rust_norm
	}
	{
		stage specularMap
		map textures/eX/eXmetalBase05Rust_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase06rust_d
{
	qer_editorimage	textures/eX/eXmetalBase06rust_d
	{
		stage diffuseMap
		map textures/eX/eXmetalBase06rust_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalBase05Rust_local
	}
	{
		stage specularMap
		map textures/eX/eXmetalBase05Rust_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase07Rust
{
	qer_editorimage	textures/eX/eXmetalBase07Rust_d
	{
		stage diffuseMap
		map textures/eX/eXmetalBase07Rust_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalBase05Rust_local
	}
	{
		stage specularMap
		map textures/eX/eXmetalBase05Rust_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalFloor02_d
{
	qer_editorimage	textures/eX/eXmetalFloor02_d
	{
		stage diffuseMap
		map textures/eX/eXmetalFloor02_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalFloor02_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetalFloor02_norm
	}
	{
		stage specularMap
		map textures/eX/eXmetalFloor02_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalrib01_d
{
	qer_editorimage	textures/eX/eXmetalrib01_d
	{
		stage diffuseMap
		map textures/eX/eXmetalrib01_d
	}
	{
		stage normalMap
		map textures/eX/eXmetalrib01_local
	}
	{
		stage normalParallaxMap
		map textures/eX/eXmetalrib01_norm
	}
	{
		stage specularMap
		map textures/eX/eXmetalrib01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_lightpanel_01_d
{
	qer_editorimage	textures/eX/eX_lightpanel_01_d
	{
		stage diffuseMap
		map textures/eX/eX_lightpanel_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_lightpanel_01_local
	}
	{
		stage specularMap
		map textures/eX/eX_lightpanel_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_lightpanel_01_lit
{
	qer_editorimage	textures/eX/eX_lightpanel_01_d
	{
		stage diffuseMap
		map textures/eX/eX_lightpanel_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_lightpanel_01_local
	}
	{
		stage specularMap
		map textures/eX/eX_lightpanel_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eX/eX_lightpanel_01_add
		blendfunc add
	}
}

textures/eX/eX_lightpanel_01_lit_1000
{
	qer_editorimage	textures/eX/eX_lightpanel_01_d
	{
		stage diffuseMap
		map textures/eX/eX_lightpanel_01_d
	}
	{
		stage normalMap
		map textures/eX/eX_lightpanel_01_local
	}
	{
		stage specularMap
		map textures/eX/eX_lightpanel_01_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eX/eX_lightpanel_01_add
		blendfunc add
	}
}

textures/eX/eX_light_u201_d
{
	qer_editorimage	textures/eX/eX_light_u201_d
	{
		stage diffuseMap
		map textures/eX/eX_light_u201_d
	}
	{
		stage normalMap
		map textures/eX/eX_light_u201_local
	}
	{
		stage specularMap
		map textures/eX/eX_light_u201_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_light_u201_lit
{
	qer_editorimage	textures/eX/eX_light_u201_d
	{
		stage diffuseMap
		map textures/eX/eX_light_u201_d
	}
	{
		stage normalMap
		map textures/eX/eX_light_u201_local
	}
	{
		stage specularMap
		map textures/eX/eX_light_u201_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eX/eX_light_u201_add
		blendfunc add
	}
}

textures/eX/eX_light_u201_lit_1000
{
	qer_editorimage	textures/eX/eX_light_u201_d
	{
		stage diffuseMap
		map textures/eX/eX_light_u201_d
	}
	{
		stage normalMap
		map textures/eX/eX_light_u201_local
	}
	{
		stage specularMap
		map textures/eX/eX_light_u201_s
		specularreflectance 0.52050
		specularexponent 128
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eX/eX_light_u201_add
		blendfunc add
	}
}