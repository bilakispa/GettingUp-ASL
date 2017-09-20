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
	
	vars.firstGameStarted = false;
	vars.gameDirStartAddr = 0x264D68;
	vars.gameDirEndOffset = 0x0;
	vars.finalCutsceneAddr = 0x26B500;
	
	vars.firstCutsceneBefore = false;
	vars.firstCutsceneAfter = false;
	
	vars.completedLevelOnce = false;
	vars.onceMapNameOffset = 0x28;
	vars.startMapNameOffset = 0x2C;
	vars.endMapNameOffset = 0x64;
	
	current.startMapName = "";
	current.endMapName = "";
	current.finalCutscene = "";
}

update {
	if(vars.firstGameStarted) {
		if(vars.completedLevelOnce) {
			current.startMapName = memory.ReadString(memory.ReadPointer((IntPtr)(vars.gameDirStartAddr + vars.gameDirEndOffset + vars.startMapNameOffset + vars.MEGU_OFFSET)), 30);
		} else {
			current.startMapName = memory.ReadString(memory.ReadPointer((IntPtr)(vars.gameDirStartAddr + vars.gameDirEndOffset + vars.onceMapNameOffset + vars.MEGU_OFFSET)), 30);
			if(!current.startMapName.StartsWith("map:")) {
				current.startMapName = memory.ReadString(memory.ReadPointer((IntPtr)(vars.gameDirStartAddr + vars.gameDirEndOffset + vars.startMapNameOffset + vars.MEGU_OFFSET)), 30);
				vars.completedLevelOnce = true;
			}
		}
		
		current.endMapName = memory.ReadString(memory.ReadPointer((IntPtr)(vars.gameDirStartAddr + vars.gameDirEndOffset + vars.endMapNameOffset + vars.MEGU_OFFSET)), 30);
		if(current.endMapName == null)
			current.endMapName = "";
		
		current.finalCutscene = memory.ReadString((IntPtr)(vars.finalCutsceneAddr + vars.MEGU_OFFSET), 256);
		if(current.finalCutscene == null)
			current.finalCutscene = "";
	} else {
		vars.secondAddr = memory.ReadPointer((IntPtr)(vars.gameDirStartAddr + 0x4 + vars.MEGU_OFFSET));
		if(vars.secondAddr != IntPtr.Zero) {
			vars.firstGameStarted = true; //A level has started
			while(vars.gameDirEndOffset < 0x100) { //0x100 = a number to limit how far the check will search for spaces
				if(memory.ReadString(memory.ReadPointer((IntPtr)(vars.gameDirStartAddr + vars.gameDirEndOffset + vars.MEGU_OFFSET)), 255).EndsWith(".exe")) {
					break;
				}
				
				vars.gameDirEndOffset += 0x4;
			}
			
			current.startMapName = "";
		} else { //A level hasn't started yet, don't do the start{} check.
			return false;
		}
	}
}

start {
	if(vars.firstCutsceneAfter) { //if passed the cutscene and is on loading screen
		if(current.startMapName.Equals(vars.levels[0])) { //Reseting the vars when manually reseting the timer
				vars.firstCutsceneBefore = vars.firstCutsceneAfter = false;
		} else if(current.startMapName.Equals(vars.levels[1]) && current.notLoading == 1) { //if passed the loading screen
			return true;
		}
	} else if(vars.firstCutsceneBefore) { //if passed the cutscene but before the loading screen
		if(current.notLoading != 1) {
			vars.firstCutsceneAfter = true;
		}
	} else if(old.startMapName.Equals(vars.levels[0]) && current.startMapName.Equals(vars.levels[1])) {
		vars.firstCutsceneBefore = true;
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
