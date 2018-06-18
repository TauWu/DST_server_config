local assets =
{
	Asset( "ANIM", "anim/weiss.zip" ),
	Asset( "ANIM", "anim/ghost_weiss_build.zip" ),
}

local skins =
{
	normal_skin = "weiss",
	ghost_skin = "ghost_weiss_build",
}

local base_prefab = "weiss"

local tags = {"WEISS", "CHARACTER"}

return CreatePrefabSkin("weiss_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})