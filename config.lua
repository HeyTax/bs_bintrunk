Config = {}

Config.Debug = false --Debug Version Coming Soon ^^
Config.CustomLoading = true -- If You use custom loading bars goto line 133


Config.AllObject = { "p_dumpster_t", "prop_dumpster_3a", "prop_dumpster_02a", "prop_bin_05a", "prop_bin_02a", "prop_dumpster_4b", "prop_dumpster_01a", "prop_dumpster_4a" , "m23_2_prop_m32_dumpster_01a", "prop_recyclebin_04_a", "prop_bin_delpiero", "prop_bin_03a", "prop_bin_beach_01d", "prop_bin_07b", "prop_bin_04a" , "prop_food_bin_02", "ch_prop_casino_bin_01a" , "v_serv_metro_wallbin", "prop_bin_01a" , "prop_bin_delpiero_b", "prop_bin_03a", "vw_prop_vw_casino_bin_01a", "zprop_bin_01a_old", "prop_bin_07d", "v_ind_bin_01", "prop_recyclebin_01a", "prop_bin_06a", "prop_cs_bin_01", "prop_cs_bin_02", "prop_recyclebin_04_b", "hei_heist_kit_bin_01", "m23_2_int5_m232_bin", "prop_bin_09a", "prop_cs_bin_01_skinned", "prop_bin_07c", "prop_gas_binunit01", "prop_recyclebin_05_a", "v_ret_gc_bin", "prop_bin_08open", "prop_recyclebin_02b", "xm3_prop_xm3_med_wastebin_01a", "prop_cs_bin_03", "prop_recyclebin_02_c", "prop_cs_bin_01_skinned", "prop_bin_08open", "prop_bin_10b", "prop_bin_11b", "prop_bin_11a", "prop_dumpster_4b", "prop_dumpster_01a", "prop_bin_10a" , "prop_gas_smallbin01", "ch_chint02_paper_bin", "v_corp_bombbin", "bkr_ware03_bin", "prop_bin_07c", "prop_bin_delpiero"}
Config.Dumps = {
	BigDumps = { "p_dumpster_t", "prop_dumpster_3a", "prop_dumpster_02a", "prop_dumpster_4b", "prop_dumpster_01a", "prop_dumpster_4a" , "m23_2_prop_m32_dumpster_01a"},
	NormalDumps = { "prop_recyclebin_04_a", "prop_bin_delpiero", "prop_bin_05a", "prop_bin_03a", "prop_bin_02a", "prop_bin_beach_01d", "prop_bin_07b", "prop_bin_04a" , "prop_food_bin_02", "ch_prop_casino_bin_01a" , "v_serv_metro_wallbin", "prop_bin_01a" , "prop_bin_delpiero_b", "prop_bin_03a", "vw_prop_vw_casino_bin_01a", "zprop_bin_01a_old", "prop_bin_07d", "v_ind_bin_01", "prop_recyclebin_01a", "prop_bin_06a", "prop_cs_bin_01", "prop_cs_bin_02", "prop_recyclebin_04_b", "hei_heist_kit_bin_01", "m23_2_int5_m232_bin", "prop_bin_09a", "prop_cs_bin_01_skinned", "prop_bin_07c", "prop_gas_binunit01", "prop_recyclebin_05_a", "v_ret_gc_bin", "prop_bin_08open", "prop_recyclebin_02b", "xm3_prop_xm3_med_wastebin_01a", "prop_cs_bin_03", "prop_recyclebin_02_c", "prop_cs_bin_01_skinned", "prop_bin_08open"},
	SmallDumps = { "prop_bin_10b", "prop_bin_11b", "prop_bin_11a", "prop_bin_10a" , "prop_gas_smallbin01", "ch_chint02_paper_bin", "v_corp_bombbin", "bkr_ware03_bin", "prop_bin_07c"},
}

Config.Dumpweight = {
	Big = 25000,
	Normal = 9000,
	Small = 4000,
}

Config.CheckIfDistanceIsOk = false -- This affects performance. I will fix it in the later version, but currently this is the only way to fix the problem

Config.Lang = "en"
Config.Text = {
	["en"] = {
		NoBinNear = "You don't have a trash can nearby!",
		OpenBin = "Opens from trash can",
		BinText = "TRASH BIN",
	}
	["de"] = {
		NoBinNear = "Du hast kein Mülleimer in der Nähe!",
		OpenBin = "Öffnen von Mülleimer",
		BinText = "MÜLLEIMER",
	}



}

