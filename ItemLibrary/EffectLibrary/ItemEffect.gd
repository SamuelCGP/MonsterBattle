class_name ItemEffect
extends Resource

var linked_monster: BattleMonster
var trigger = ""
var effect = func placeholder(): return

func equip(monster: BattleMonster, is_unequip: bool = false):
	linked_monster = monster
	if not is_unequip:
		linked_monster.connect(trigger, effect)
	var factor = 1 if not is_unequip else -1
	
	equip_effect(factor)
	
	if is_unequip:
		linked_monster = null
		if is_connected(trigger, effect):
			disconnect(trigger, effect)
	
func unequip():
	equip(linked_monster, true)

func equip_effect(_factor: int):
	# increase stat values in this style:
	# linked_monster.max_stamina += value * factor
	# the "factor" is 1 when equipping and -1 when unequipping
	pass
