extends BodypartEars

func _init():
	visibleName = "canine ears"
	id = "canineears"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/CanineEars/CanineEars.tscn"
