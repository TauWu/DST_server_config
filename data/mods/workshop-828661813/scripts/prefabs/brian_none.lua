local assets =
{
	Asset( "ANIM", "anim/brian.zip" ),
	Asset( "ANIM", "anim/ghost_brian_build.zip" ),
}

local skins =
{
	normal_skin = "brian",
	ghost_skin = "ghost_brian_build",
}

local base_prefab = "brian"

local tags = {"BRIAN", "CHARACTER"}

return CreatePrefabSkin("brian_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})