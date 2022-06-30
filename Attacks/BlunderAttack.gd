extends Attack

func _init():
	id = "blunderAttack"
	category = Category.Special
	
func getVisibleName():
	return "Do nothing"
	
func getVisibleDesc():
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver):
	var attackerName = _attacker.getName()

	return attackerName + " wasn't able to attack"
	
func _canUse(_attacker, _receiver):
	return true

func canBeDodgedByPlayer(_attacker, _receiver):
	return false

func getAIScore(_attacker, _receiver):
	return 0.0

func canDoWhileStunned():
	return true