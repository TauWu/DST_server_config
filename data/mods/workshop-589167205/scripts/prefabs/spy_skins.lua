local skins = {}
for k,v in pairs(SPYSKINS.SPY) do
	local assets = {}
	for skin,anim in pairs(v.builds) do
		table.insert(assets, anim)
	end
	if SKIN_RARITY_COLORS.ModMade ~= nil then table.insert(skins, AddModCharacterSkin("spy", k, v.builds, assets, {"SPY", "CHARACTER"}, v.options)) end
end

return CreatePrefabSkin("spy_none", {
	base_prefab = "spy",
	skins = {
		normal_skin = "spy",
		ghost_skin = "ghost_spy_build",
	},
	assets = {
		Asset( "ANIM", "anim/spy.zip" ),
		Asset( "ANIM", "anim/ghost_spy_build.zip" ),
	},
	tags = {"SPY", "CHARACTER"},
	skip_item_gen = true,
	skip_giftable_gen = true,
}), unpack(skins)