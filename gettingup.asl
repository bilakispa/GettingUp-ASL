//Author: Bilakispa (http://www.speedrun.com/user/bilakispa)
//Thanks to:
//Jazz (http://www.speedrun.com/user/Jazz)
//Robotic (http://www.speedrun.com/user/RoboticDream)
state("GettingUp") {
	byte notLoading: "GettingUp.exe", 0x798100;
}
	
startup {
	vars.levels = new string[] {
		"map:M00_CIV_Intro_1",
		"map:M01_HOO_Tranes_Hood_1",
		"map:M01_HOO_Tranes_Hood_1a",
		"map:M01_HOO_Tranes_Hood_2",
		"map:M01_HOO_Tranes_Hood_3",
		"map:M01_HOO_Tranes_Hood_4",
		"map:M02_HOO_Subway_1a",
		"map:M02_HOO_Subway_1b",
		"map:M02_HOO_Subway_2",
		"map:M02_HOO_Subway_3",
		"map:M03_HOO_Whos_Got_Beef_1",
		"map:M03_HOO_Whos_Got_Beef_2",
		"map:M03_HOO_Whos_Got_Beef_3",
		"map:M03_HOO_Whos_Got_Beef_4",
		"map:M04_HOO_Subway_Layup_1a",
		"map:M04_HOO_Subway_Layup_1b",
		"map:M04_HOO_Subway_Layup_2",
		"map:M05_HOO_Battle_1",
		"map:M05_HOO_Battle_3",
		"map:M06_IND_Bulletproof_1",
		"map:M06_IND_Bulletproof_2",
		"map:M06_IND_Bulletproof_3",
		"map:M07_HOO_Blind_Justice_1",
		"map:M07_HOO_Blind_Justice_2",
		"map:M07_HOO_Blind_Justice_3",
		"map:M08_HOO_Remember_Alamo_1",
		"map:M08_HOO_Remember_Alamo_3",
		"map:M09_CIV_Cat_and_Mouse_1a",
		"map:M09_CIV_Cat_and_Mouse_1b",
		"map:M09_CIV_Cat_and_Mouse_2",
		"map:M10_CIV_Bridge_1",
		"map:M10_CIV_Bridge_2",
		"map:M11_CIV_Blimp_1",
		"map:M11_CIV_Blimp_2",
		"map:m_rhapsody_shell"
	};

	//Chapter 1
	settings.Add("chapter1", true, "Chapter 1: Welcome To New Radius");
	settings.Add("split1", false, "Grandma Celia's", "chapter1");
	settings.Add("split2", false, "Trane's Hood", "chapter1");
	settings.Add("split3", false, "The Pool Yard", "chapter1");
	settings.Add("split4", false, "Storefront Row", "chapter1");
	settings.Add("split5", true, "Abandoned Art School", "chapter1");
	
	//Chapter 2
	settings.Add("chapter2", true, "Chapter 2: Goind Underground");
	settings.Add("split6", false, "The Subway Tunnels", "chapter2");
	settings.Add("split7", false, "The Lay-Up", "chapter2");
	settings.Add("split8", false, "Subway Ride", "chapter2");
	settings.Add("split9", true, "Dip's Hideout", "chapter2");
	
	//Chapter 3
	settings.Add("chapter3", true, "Chapter 3: Who's Got Beef");
	settings.Add("split10", false, "Gabe's Hood", "chapter3");
	settings.Add("split11", false, "Meat Packing Plant", "chapter3");
	settings.Add("split12", false, "Vanr Chill Space", "chapter3");
	settings.Add("split13", true, "Gabe's Hideout", "chapter3");
	
	//Chapter 4
	settings.Add("chapter4", true, "Chapter 4: The Ghost Yard");
	settings.Add("split14", false, "Yard Entrance", "chapter4");
	settings.Add("split15", false, "Interior Ghost Yard", "chapter4");
	settings.Add("split16", true, "Lights Out", "chapter4");
	
	//Chapter 5
	settings.Add("chapter5", true, "Chapter 5: Still Fake Crew?");
	settings.Add("split17", false, "New Radius Tunnel", "chapter5");
	settings.Add("split18", true, "Amusement Pier", "chapter5");
	
	//Chapter 6
	settings.Add("chapter6", true, "Chapter 6: Kids Think They're Bulletproof");
	settings.Add("split19", false, "New Radius Freeway", "chapter6");
	settings.Add("split20", false, "Tramnet Safecars Tower", "chapter6");
	settings.Add("split21", true, "Going For A Tram Ride", "chapter6");
	
	//Chapter 7
	settings.Add("chapter7", true, "Chapter 7: Blind Justice");
	settings.Add("split22", false, "Exterior CCK HQ", "chapter7");
	settings.Add("split23", false, "Interior CCK HQ", "chapter7");
	settings.Add("split24", true, "Hunt's Helipad", "chapter7");
	
	//Chapter 8
	settings.Add("chapter8", true, "Chapter 8: Smoke Out The Rats");
	settings.Add("split25", false, "SFC Hideout", "chapter8");
	settings.Add("split26", true, "School Rooftop", "chapter8");
	
	//Chapter 9
	settings.Add("chapter9", true, "Chapter 9: A Game Of Cat And Mouse");
	settings.Add("split27", false, "Port Authority", "chapter9");
	settings.Add("split28", false, "Lumen Square Station", "chapter9");
	settings.Add("split29", true, "Subway Platform", "chapter9");
	
	//Chapter 10
	settings.Add("chapter10", true, "Chapter 10: The Revolution Will Be Televised");
	settings.Add("split30", false, "New Radius Bridge", "chapter10");
	settings.Add("split31", true, "Bridge Docking Station", "chapter10");
	
	//Chapter 11
	settings.Add("chapter11", true, "Chapter 11: Auld Lang Syne");
	settings.Add("split32", false, "NNR News Blimp", "chapter11");
	settings.Add("split33", true, "The Blimp Roof", "chapter11");
}

init {
	vars.MEGU_OFFSET = 0x400000; //An offset from "GettingUp.exe"
	vars.EXE_DIRECTORY_OFFSET = 0x264D68; // And offset for the pointer that shows where the .exe is
	vars.CONFIG_OFFSET = 0x0; // Offset from the end of directory
	vars.MAP_ONLOAD_OFFSET = 0x24; // Offset for the map: at the load of a level
	vars.MAP_ONFINISH_OFFSET = 0x60; // Offset for the map: at the finish of a level
	vars.FINAL_CUTSCENE_ADDR = 0x26B500;
	
	vars.gameSessionStatus = 0; // 0 = Initialized, 1 = Started a level, 2 = Finished a level
	vars.firstLevelStatus = 0; // 0 = Not Detected, 1 = Detected (Before Loading), 2 = Detected after loading (START)

	// Find the config offset
	for(int i=0; i<100; i++) {
		IntPtr stringPointer = memory.ReadPointer((IntPtr)(vars.MEGU_OFFSET + vars.EXE_DIRECTORY_OFFSET + vars.CONFIG_OFFSET));
		String directoryString = memory.ReadString(stringPointer, 256);
		
		vars.CONFIG_OFFSET += 0x4;
		
		if (directoryString.EndsWith("GettingUp.exe")) { // Found the offset
			break;
		}
	}

	current.startMapName = "";
	current.endMapName = "";
	current.finalCutscene = "";
}

update {
	switch((int)vars.gameSessionStatus) {
		case 0:
			IntPtr firstConfigPointer = memory.ReadPointer((IntPtr)(vars.MEGU_OFFSET + vars.EXE_DIRECTORY_OFFSET + vars.CONFIG_OFFSET + vars.MAP_ONLOAD_OFFSET));
			
			if (firstConfigPointer == IntPtr.Zero) { // Not started a level
				return false; // Don't do start {} check
			}
			
			if (vars.CONFIG_OFFSET == 4) { 
				for(int i=0; i<100; i++) { // Find the correct config offset
					IntPtr stringPointer = memory.ReadPointer((IntPtr)(vars.MEGU_OFFSET + vars.EXE_DIRECTORY_OFFSET + vars.CONFIG_OFFSET));
					String directoryString = memory.ReadString(stringPointer, 256);
					
					vars.CONFIG_OFFSET += 0x4;
					
					if (directoryString.EndsWith("GettingUp.exe")) { // Found the offset
						break;
					}
				}
			}
			
			vars.gameSessionStatus = 1;
		break;
		case 1: // Started a level
			IntPtr mapLoadPointer = memory.ReadPointer((IntPtr)(vars.MEGU_OFFSET + vars.EXE_DIRECTORY_OFFSET + vars.CONFIG_OFFSET + vars.MAP_ONLOAD_OFFSET));
			String mapLoadString = memory.ReadString(mapLoadPointer, 30);
			
			if (!mapLoadString.StartsWith("map:")) { // Finished a level
				vars.MAP_ONLOAD_OFFSET += 0x4;
				vars.gameSessionStatus = 2;
			}
		break;
	}
	
	current.startMapName = memory.ReadString(memory.ReadPointer((IntPtr)(vars.MEGU_OFFSET + vars.EXE_DIRECTORY_OFFSET + vars.CONFIG_OFFSET + vars.MAP_ONLOAD_OFFSET)), 30);
	if (current.startMapName == null) {
		current.startMapName = "";
	}
	
	current.endMapName = memory.ReadString(memory.ReadPointer((IntPtr)(vars.MEGU_OFFSET + vars.EXE_DIRECTORY_OFFSET + vars.CONFIG_OFFSET + vars.MAP_ONFINISH_OFFSET)), 30);
	if(current.endMapName == null) {
		current.endMapName = "";
	}
	
	current.finalCutscene = memory.ReadString((IntPtr)(vars.MEGU_OFFSET + vars.FINAL_CUTSCENE_ADDR), 256);
	if(current.finalCutscene == null) {
		current.finalCutscene = "";
	}
}

start {
	switch((int)vars.firstLevelStatus) {
		case 0: // Not detected a level start
			if (current.startMapName.Equals(vars.levels[1])) {
				vars.firstLevelStatus = 1;
			}
		break;
		case 1: // Detected, before loading screen
			if (current.startMapName.Equals(vars.levels[1]) && current.notLoading != 1) { // Is on the loading screen
				vars.firstLevelStatus = 2;
			}
		break;
		case 2: // Detected, on the loading screen
			if(current.startMapName.Equals(vars.levels[1]) && current.notLoading == 1) { // Passed the loading screen
				vars.firstLevelStatus = 0; // Reset the var to not re-start on trying to reset while is on the level
				return true;
			}
		break;
	}
}

split {
	if(current.endMapName.Equals(vars.levels[34])) { //if it's on main screen after completing a level
		for(int i=1; i<34; i++) {
			if(String.Equals(old.startMapName, vars.levels[i], StringComparison.OrdinalIgnoreCase) && settings["split" + i])
				return true;
		}
	}
	
	//Final split
	if(current.finalCutscene.EndsWith("m11_010.bik") && current.finalCutscene != old.finalCutscene)
		return settings["split33"];

	return false;
}

isLoading {
	return current.notLoading != 1;
}

exit {
    timer.IsGameTimePaused = false;
}
