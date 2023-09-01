extends Attack

func _init():
	id = "SeriousPunchPCAttack"
	category = Category.Special
	aiCategory = AICategory.Offensive
	isPlayerAttack = true
	attackPriority = 10
	
func getVisibleName(_context = {}):
	return "Serious Punch"
	
func getVisibleDesc(_context = {}):
	return "{attacker.name} Punch Seriously"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver, "punch")
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "punch")
	
	var texts = [
		"{attacker.name} Got Serious And Punched {receiver.name}."
	]
	var text = RNG.pick(texts)
	
	if(RNG.chance(50) && !_receiver.hasEffect(StatusEffect.Collapsed)):
		if(_receiver.addEffect(StatusEffect.Collapsed)):
			text += "\n[b]{receiver.name} loses {receiver.his} balance and collapses onto the floor[/b]."
	
	return {
		text = text,
		pain = RNG.randi_range(10, 15),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [AttackRequirement.FreeArms]

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} is about to punch {receiver.name}"

func getAttackSoloAnimation():
	return "punch"

func getExperience():
	return [[Skill.Combat, 100]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.25
