extends BodypartLeg

func _init():
	visibleName = "human legs"
	id = "humanleg"

func getCompatibleSpecies():
	return [Species.Human]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Legs/HumanLegs/HumanLegs.tscn"