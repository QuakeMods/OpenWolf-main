// eX (C) 2018 Dusan Jocic <dusanjocic@msn.com>

textures/eX/eX_clangfloor_01_d
{
	qer_editorimage textures/Dushan/Metal_BumpySquares_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_BumpySquares_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_BumpySquares_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_BumpySquares_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	implicitMap -
}

textures/eX/eX_clangfloor_01b_d
{
	qer_editorimage	textures/Dushan/Metal_BrushedSteelFineGrains_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_BrushedSteelFineGrains_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_BrushedSteelFineGrains_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_BrushedSteelFineGrains_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretebase_01_d
{
	qer_editorimage	textures/Dushan/Metal_CorrugatedPaintedClean_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_CorrugatedPaintedClean_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_CorrugatedPaintedClean_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_CorrugatedPaintedClean_2k_g
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretebase_02_d
{
	qer_editorimage	textures/eX/eX_cretebase_02_d
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/eX/eX_cretebase_02_d
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_cretebase_01_n
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
	}
	{
		stage specularMap
		map textures/eX/eX_cretebase_01_s
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretebase_03_dark_d
{
	qer_editorimage	textures/Dushan/Metal_BrushedMetalTilesDirty_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_BrushedMetalTilesDirty_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_BrushedMetalTilesDirty_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_BrushedMetalTilesDirty_2k_g
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretefloor_01_d
{
	qer_editorimage	textures/Dushan/Metal_rectangleGratingFloor_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_rectangleGratingFloor_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_rectangleGratingFloor_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_rectangleGratingFloor_2k_g
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_rectangleGratingFloor_2k_mask
	}

	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretefloor_01b_d
{
	qer_editorimage	textures/Dushan/Metal_ChromeDiscoWall_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_ChromeDiscoWall_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_ChromeDiscoWall_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_ChromeDiscoWall_2k_g
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretewall_01_d
{
	qer_editorimage	textures/Dushan/Metal_SciFiMetalKit_2k_d
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiMetalKit_2k_d
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiMetalKit_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiMetalKit_2k_s
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretewall_02_d
{
	qer_editorimage	textures/Dushan/Metal_CorrugatedAngularWall_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_CorrugatedAngularWall_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_CorrugatedAngularWall_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_CorrugatedAngularWall_2k_g
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_CorrugatedAngularWall_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretewall_03_d
{
	qer_editorimage	textures/Dushan/Metal_CorrugatedAngularWallPainted_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_CorrugatedAngularWallPainted_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_CorrugatedAngularWallPainted_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_CorrugatedAngularWallPainted_2k_g
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_CorrugatedAngularWallPainted_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_cretewall_03b_d
{
	qer_editorimage	textures/Dushan/Metal_SciFiMetalKitRust_2k_d
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiMetalKitRust_2k_d
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiMetalKitRust_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiMetalKitRust_2k_g
		specularreflectance 0.52050
		specularexponent 64
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiMetalKitRust_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_deswall_01_d
{
	qer_editorimage	textures/Dushan/Metal_ReinforcedGridWall_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate03_d
{
	qer_editorimage	textures/Dushan/Metal_ReinforcedGridWall_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate03_trans
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_ReinforcedGridWall_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_ReinforcedGridWall_2k_mask
	}
	{
		map $lightmap
		depthfunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate_03_128_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiFloorPlates_2k_alb
	surfaceparm metalsteps
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiFloorPlates_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiFloorPlates_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiFloorPlates_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiFloorPlates_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate_03_128_trans
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiFloorPlates_2k_alb
	surfaceparm metalsteps
	cull none
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiFloorPlates_2k_alb
		alphafunc ge128
		depthwrite
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiFloorPlates_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiFloorPlates_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiFloorPlates_2k_mask
	}
	{
		map $lightmap
		depthfunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate_03_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_alb
	surfaceparm metalsteps
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_grate_03_trans
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/eX_Metal_SciFiFloorPlateWithHoles_2k_alb
	surfaceparm metalsteps
	cull none
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_alb
		alphafunc ge128
		depthwrite
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiFloorPlateWithHoles_2k_mask
	}
	{
		map $lightmap
		depthfunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_mtl_grate_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiMetalWallRectangle_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiMetalWallRectangle_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiMetalWallRectangleCornerLights_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiMetalWallRectangleCornerLights_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiMetal_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_mtl_grate_01_trans
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiMetalWallRectangle_2k_alb
	surfaceparm metalsteps
	cull none
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiMetalWallRectangle_2k_alb
		alphafunc ge128
		depthwrite
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiMetalWallRectangleCornerLights_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiMetalWallRectangleCornerLights_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiMetal_2k_mask
	}
	{
		map $lightmap
		depthfunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_mtl_wrn_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_CorrugatedWarehouseCeiling_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_CorrugatedWarehouseCeiling_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_CorrugatedWarehouseCeiling_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_CorrugatedWarehouseCeiling_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_CorrugatedWarehouseCeiling_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_simple_05_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFloorPanels_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFloorPanels_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFloorPanels_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFloorPanels_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFloorPanels_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_simplines_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_CorrugatedPaintedClean_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_CorrugatedPaintedClean_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_CorrugatedPaintedClean_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_CorrugatedPaintedClean_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_tile_03_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFloorWithLights_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFloorWithLights_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFloorWithLights_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFloorWithLights_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFloorWithLights_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floor_tread_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFloorWithVents_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFloorWithVents_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFloorWithVents_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFloorWithVents_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFloorWithVents_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_floorpanel_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiFloorplate_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiFloorplate_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiFloorplate_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiFloorplate_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiFloorplate_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_metalplate_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_PlatedWalkway_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_PlatedWalkway_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_PlatedWalkway_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_PlatedWalkway_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_PlatedWalkway_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_metalSupp01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_InteriorwallSupports_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_InteriorwallSupports_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_InteriorwallSupports_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_InteriorwallSupports_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_metalwall02_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiWall_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiWall_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiWall_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiWall_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiWall_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_bigplate_04_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SteelPlates_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SteelPlates_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SteelPlates_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SteelPlates_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SteelPlates_2k_masks
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_bigplate_04b_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_DiamondPlate_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_DiamondPlate_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_DiamondPlate_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_DiamondPlate_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_panel_02_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_DiamondplateTilesRustOld_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_DiamondplateTilesRustOld_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_DiamondplateTilesRustOld_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_DiamondplateTilesRustOld_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_panel_03_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_StephSciFiFloorClean_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_StephSciFiFloorClean_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_StephSciFiFloorClean_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_StephSciFiFloorClean_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_mtl_panel_04_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiCompartmentPanels_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiCompartmentPanels_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiCompartmentPanels_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiCompartmentPanels_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_OrnateMetalCeiling_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_OrnateMetalCeiling_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_OrnateMetalCeiling_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_OrnateMetalCeiling_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01b_d
{
	q3map_material solidmetal
	q3map_lightimage textures/utcsud/utcsud_03
	q3map_surfacelight 8000
	q3map_lightRGB 0.94 0.57 0.13
    q3map_lightSubdivide 16
	qer_editorimage	textures/Dushan/Metal_OverlapingPlatesBolted_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_OverlapingPlatesBolted_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_OverlapingPlatesBolted_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_OverlapingPlatesBolted_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01c_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_OverlapingPlatesBolted_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_OverlapingPlatesBolted_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_OverlapingPlatesBolted_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_OverlapingPlatesBolted_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01d_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_OxidizedAluminium_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_OxidizedAluminium_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_OxidizedAluminium_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_OxidizedAluminium_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_q2_01e_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_PaintedSteelBase_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_PaintedSteelBase_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_PaintedSteelBase_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_PaintedSteelBase_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_rndfloor_01_d
{
	qer_editorimage	textures/Dushan/Metal_SquareTraction_2k_alb
	q3map_material hollowmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_SquareTraction_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SquareTraction_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SquareTraction_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SquareTraction_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_rndfloor_02_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SteelFloorGrating_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SteelFloorGrating_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SteelFloorGrating_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SteelFloorGrating_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SteelFloorGrating_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_rplates_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_OverlapingPlatesBoltedRusty_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_OverlapingPlatesBoltedRusty_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_OverlapingPlatesBoltedRusty_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_OverlapingPlatesBoltedRusty_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_OverlapingPlatesBoltedRusty_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_steptop_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FanVentpinWheel_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FanVentpinWheel_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FanVentpinWheel_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FanVentpinWheel_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_DiscoWallConcave_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_DiscoWallConcave_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_DiscoWallConcave_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_DiscoWallConcave_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_baseboard_02_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FenceAradClean_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FenceAradClean_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FenceAradClean_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FenceAradClean_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FenceAradClean_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_baseboard_03_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FenceAradClean_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FenceAradClean_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FenceAradClean_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FenceAradClean_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FenceAradClean_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_baseboard_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FlatPlateWithRailing_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FlatPlateWithRailing_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FlatPlateWithRailing_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FlatPlateWithRailing_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FlatPlateWithRailing_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_psimple_04_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FlatPlateWithRailingRust_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_psimple_05_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FlatPlateWithRailingRust_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_simple03_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FlatPlateWithRailingRust_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FlatPlateWithRailingRust_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_simple_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FlatUnpainted_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FlatUnpainted_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FlatUnpainted_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FlatUnpainted_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FlatUnpainted_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_support_03_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FlatUnpainted_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FlatUnpainted_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FlatUnpainted_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FlatUnpainted_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FlatUnpainted_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_trim_vert_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_FlatUnpainted_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_FlatUnpainted_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_FlatUnpainted_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_FlatUnpainted_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_FlatUnpainted_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_TrapezoidWallPainted_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_TrapezoidWallPainted_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_TrapezoidWallPainted_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_TrapezoidWallPainted_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_wallSciFiPanels_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_01b_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_TrapezoidWall_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_TrapezoidWall_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_TrapezoidWall_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_TrapezoidWall_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_TrapezoidWall_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_b01_d
{
	q3map_material solidmetal
		qer_editorimage	textures/Dushan/Metal_TrapezoidWall_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_TrapezoidWall_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_TrapezoidWall_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_TrapezoidWall_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_TrapezoidWall_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_bigrib_02_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_wallSciFiPanels_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_wallSciFiPanels_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_wallSciFiPanels_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_wallSciFiPanels_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_wallSciFiPanels_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_bplate_06_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_DiamondPlateSciFi_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_DiamondPlateSciFi_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_DiamondPlateSciFi_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_DiamondPlateSciFi_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_panel_05_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_SciFiConnectedPanels_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_SciFiConnectedPanels_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_SciFiConnectedPanels_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_SciFiConnectedPanels_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_SciFiConnectedPanels_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_panels_08_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_MetalKit2Rust_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_MetalKit2Rust_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_MetalKit2Rust_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}	
	{
		stage specularMap
		map textures/Dushan/Metal_MetalKit2Rust_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_MetalKit2Rust_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_panels_08b_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_MetalKit2Rust_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_MetalKit2Rust_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_MetalKit2Rust_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_MetalKit2Rust_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_MetalKit2Rust_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_pipe_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_PipeFloorBackground_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_PipeFloorBackground_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_PipeFloorBackground_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_PipeFloorBackground_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_PipeFloorBackground_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_wall_u207_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_WallPanelsWithLightTrack_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_WallPanelsWithLightTrack_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_WallPanelsWithLightTrack_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_WallPanelsWithLightTrack_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_WallPanelsWithLightTrack_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetal_plate01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_LabPanels_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_LabPanels_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_LabPanels_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_LabPanels_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_LabPanels_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetal_plate01B_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_LabPanels_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_LabPanels_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_LabPanels_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_LabPanels_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_LabPanels_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetal_plate01c_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_CrateXcorrugated_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_CrateXcorrugated_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_CrateXcorrugated_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_CrateXcorrugated_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_RustBase_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_RustBase_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_RustBase_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_RustBase_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_RustBase_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase02_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_RustBase_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_RustBase_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_RustBase_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_RustBase_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_RustBase_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase03_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_RustBase_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_RustBase_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_RustBase_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_RustBase_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_RustBase_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase04_d
{
	qer_editorimage	textures/Dushan/Metal_Rust_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_Rust_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_Rust_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_Rust_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase04_d.
{
	qer_editorimage	textures/Dushan/Metal_Rust_2k_alb
	q3map_material solidmetal
	{
		stage diffuseMap
		map textures/Dushan/Metal_Rust_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_Rust_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_Rust_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase05Rust_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_RustedSteel_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_RustedSteel_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_RustedSteel_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_RustedSteel_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_RustedSteel_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase06rust_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_ScavengerMetal_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_ScavengerMetal_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_ScavengerMetal_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_ScavengerMetal_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_ScavengerMetal_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalBase07Rust_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_ScavengerMetal_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_ScavengerMetal_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_ScavengerMetal_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_ScavengerMetal_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_ScavengerMetal_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalFloor02_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_BoltedSquarePlateRusty_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_BoltedSquarePlateRusty_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_BoltedSquarePlateRusty_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_BoltedSquarePlateRusty_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_BoltedSquarePlateRusty_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eXmetalrib01_d
{
	q3map_material solidmetal
	qer_editorimage	textures/Dushan/Metal_BeefyMetalChainlink_2k_alb
	{
		stage diffuseMap
		map textures/Dushan/Metal_BeefyMetalChainlink_2k_alb
	}
	{
		stage normalParallaxMap
		map textures/Dushan/Metal_BeefyMetalChainlink_2k_nY
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/Dushan/Metal_BeefyMetalChainlink_2k_g
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		stage overlayMap
		map textures/Dushan/Metal_BeefyMetalChainlink_2k_mask
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_lightpanel_01_d
{
	q3map_material solidmetal
	surfaceparm alphashadow
	q3map_lightimage textures/eX/eX_lightpanel_01_d
	q3map_surfacelight 8000
	q3map_lightRGB 0.94 0.57 0.13
    q3map_lightSubdivide 16
	qer_editorimage	textures/eX/eX_lightpanel_01_d
	{
		stage diffuseMap
		map textures/eX/eX_lightpanel_01_d
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_lightpanel_01_n
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/eX/eX_lightpanel_01_s
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_lightpanel_01_lit
{
	q3map_material solidmetal
	surfaceparm alphashadow
	q3map_lightimage textures/eX/eX_lightpanel_01_d
	q3map_surfacelight 8000
	q3map_lightRGB 0.94 0.57 0.13
    q3map_lightSubdivide 16
	qer_editorimage	textures/eX/eX_lightpanel_01_d
	{
		stage diffuseMap
		map textures/eX/eX_lightpanel_01_d
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_lightpanel_01_n
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/eX/eX_lightpanel_01_s
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eX/eX_lightpanel_01_d
		blendfunc add
		alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
	}
}

textures/eX/eX_lightpanel_01_lit_1000
{
	q3map_material solidmetal
	surfaceparm alphashadow
	q3map_lightimage textures/eX/eX_lightpanel_01_d
	q3map_surfacelight 8000
	q3map_lightRGB 0.94 0.57 0.13
    q3map_lightSubdivide 16
	qer_editorimage	textures/eX/eX_lightpanel_01_d
	{
		stage diffuseMap
		map textures/eX/eX_lightpanel_01_d
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_lightpanel_01_n
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/eX/eX_lightpanel_01_s
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eX/eX_lightpanel_01_d
		blendfunc add
		alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
	}
}

textures/eX/eX_light_u201_d
{
	q3map_material solidmetal
	surfaceparm alphashadow
	q3map_lightimage textures/eX/eX_light_u201_d
	q3map_surfacelight 8000
	q3map_lightRGB 0.94 0.57 0.13
    q3map_lightSubdivide 16
	qer_editorimage	textures/eX/eX_light_u201_d
	{
		stage diffuseMap
		map textures/eX/eX_light_u201_d
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_light_u201_n
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/eX/eX_light_u201_s
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/eX/eX_light_u201_lit
{
	q3map_material solidmetal
	surfaceparm alphashadow
	q3map_lightimage textures/eX/eX_light_u201_d
	q3map_surfacelight 8000
	q3map_lightRGB 0.94 0.57 0.13
    q3map_lightSubdivide 16
	qer_editorimage	textures/eX/eX_light_u201_d
	{
		stage diffuseMap
		map textures/eX/eX_light_u201_d
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_light_u201_n
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/eX/eX_light_u201_s
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eX/eX_light_u201_d
		blendfunc add
		alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
	}
}

textures/eX/eX_light_u201_lit_1000
{
	q3map_material solidmetal
	surfaceparm alphashadow
	q3map_lightimage textures/eX/eX_light_u201_d
	q3map_surfacelight 8000
	q3map_lightRGB 0.94 0.57 0.13
    q3map_lightSubdivide 16
	qer_editorimage	textures/eX/eX_light_u201_d
	{
		stage diffuseMap
		map textures/eX/eX_light_u201_d
	}
	{
		stage normalParallaxMap
		map textures/eX/eX_light_u201_n
		normalscale 1.1 1.1 1.5
		parallaxDepth 0.05
		tcMod scale .5 .5
	}
	{
		stage specularMap
		map textures/eX/eX_light_u201_s
		specularreflectance 0.52050
		specularexponent 16
		specularScale 0.36 0.54 0.66
		roughness 0.124
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eX/eX_light_u201_d
		blendfunc add
		alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
	}
}