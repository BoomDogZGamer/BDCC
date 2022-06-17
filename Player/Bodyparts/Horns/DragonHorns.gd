extends BodypartHorns

func _init():
	visibleName = "dragon horns"
	id = "dragonhorns"

func getCompatibleSpecies():
	return [Species.Dragon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Horns/DragonHorns/DragonHorns.tscn"
