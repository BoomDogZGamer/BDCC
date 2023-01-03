extends Module
class_name RahiModule

func getFlags():
	return {
		# Rahi module
		"Rahi_Introduced": flag(FlagType.Bool),
		"Rahi_AskedName": flag(FlagType.Bool),
		"Rahi_GaveApple": flag(FlagType.Bool),
		"Rahi_CanteenSceneHappened": flag(FlagType.Bool),
		"Avy_WonCanteenFight": flag(FlagType.Bool),
		"Rahi_ChillWillHappen": flag(FlagType.Bool),
		"Rahi_ChillHappened": flag(FlagType.Bool),
		"Rahi_ChillCooldown": flag(FlagType.Number),
		"Rahi_Denied": flag(FlagType.Bool),
		"Rahi_ShowerHappened": flag(FlagType.Bool),
		"Rahi_NotThereToday": flag(FlagType.Bool),
		"Rahi_FirstTimePregnantHappened": flag(FlagType.Bool),
		"Rahi_GaveBirthTimes": flag(FlagType.Number),
	}

func _init():
	id = "RahiModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/RahiModule/RahiTalkScene.gd",
		"res://Modules/RahiModule/RahiAvyCanteenScene.gd",
		"res://Modules/RahiModule/RahiChillScene.gd",
		
		"res://Modules/RahiModule/ShowerEvent/RahiShowerScene.gd",
		
		"res://Modules/RahiModule/RahiFirstTimePregnantScene.gd",
		"res://Modules/RahiModule/RahiEmbraceScene.gd",
		]
	characters = [
		"res://Modules/RahiModule/RahiCharacter.gd",
		"res://Modules/RahiModule/AvyCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/RahiModule/RahiTalkEvent.gd",
		"res://Modules/RahiModule/RahiAvyCanteenEvent.gd",
		"res://Modules/RahiModule/RahiChillEvent.gd",
		
		"res://Modules/RahiModule/ShowerEvent/RahiShowerEvent.gd",
		
		"res://Modules/RahiModule/RahiFirstTimePregnantEvent.gd",
	]

func resetFlagsOnNewDay():
	if(GM.main.getModuleFlag("RahiModule", "Rahi_NotThereToday", false)):
		GM.main.setModuleFlag("RahiModule", "Rahi_NotThereToday", false)
	
	# Chill near waterfall event stuff
	if(!GM.main.getModuleFlag("RahiModule", "Rahi_ChillHappened", false) && !GM.main.getModuleFlag("RahiModule", "Rahi_Denied", false)):
		if(GM.main.getModuleFlag("RahiModule", "Rahi_ChillCooldown", 0) > 0):
			GM.main.increaseModuleFlag("RahiModule", "Rahi_ChillCooldown", -1)

		if(GM.main.getModuleFlag("RahiModule", "Rahi_ChillCooldown", 0) == 0 && GM.main.getModuleFlag("RahiModule", "Rahi_GaveApple", false)):
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillWillHappen", true)
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillCooldown", RNG.randi_range(1, 3))
		else:
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillWillHappen", false)

static func trustsPC():
	return GM.main.getModuleFlag("RahiModule", "Rahi_ShowerHappened", false)