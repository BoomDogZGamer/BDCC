extends ItemBase

func _init():
	id = "LacePanties"

func getVisibleName():
	return "Lace panties"
	
func getDescription():
	var text = "Sexy lace panties with a fancy pattern. These are sure to make anyone horny"

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		buff(Buff.LustArmorBuff, [10]),
		buff(Buff.LustDamageBuff, [15]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your lace panties"
	else:
		return "slip down your lace panties"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the lace panties"
	else:
		return "put on the lace panties"

func coversBodyparts():
	return [BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Anus]

func getPrice():
	return 8
