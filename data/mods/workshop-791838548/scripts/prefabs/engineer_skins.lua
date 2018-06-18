local skins = {}
for k,v in pairs(ENGINEERSKINS.ENGINEER) do
	local assets = {}
	for skin,anim in pairs(v.builds) do
		table.insert(assets, anim)
	end
	if SKIN_RARITY_COLORS.ModMade ~= nil then table.insert(skins, AddModCharacterSkin("engineer", k, v.builds, assets, {"ENGINEER", "CHARACTER"}, v.options)) end
end

return CreatePrefabSkin("engineer_none", {
	base_prefab = "engineer",
	skins = {
		normal_skin = "engineer",
		ghost_skin = "ghost_engineer_build",
	},
	assets = {
		Asset( "ANIM", "anim/engineer.zip" ),
		Asset( "ANIM", "anim/ghost_engineer_build.zip" ),
	},
	tags = {"ENGINEER", "CHARACTER"},
	skip_item_gen = true,
	skip_giftable_gen = true,
}), unpack(skins)