local skins = {}
for k,v in pairs(MEDICSKINS.MEDIC) do
	local assets = {}
	for skin,anim in pairs(v.builds) do
		table.insert(assets, anim)
	end
	if SKIN_RARITY_COLORS.ModMade ~= nil then table.insert(skins, AddModCharacterSkin("medic", k, v.builds, assets, {"MEDIC", "CHARACTER"}, v.options)) end
end

return CreatePrefabSkin("medic_none", {
	base_prefab = "medic",
	skins = {
		normal_skin = "medic",
		ghost_skin = "ghost_medic_build",
	},
	assets = {
		Asset( "ANIM", "anim/medic.zip" ),
		Asset( "ANIM", "anim/ghost_medic_build.zip" ),
	},
	tags = {"MEDIC", "CHARACTER"},
	torso_untuck_wide_builds = { "medic", },
	has_alternate_for_body = { "medic", },
	has_alternate_for_skirt = { "medic", },
	skip_item_gen = true,
	skip_giftable_gen = true,
}), unpack(skins)