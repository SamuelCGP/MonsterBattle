class_name AttackNearest
extends Instinct

func instinct(linked_monster: BattleMonster):
	# This first line is necessary in every instinct
	monster = linked_monster
	
	if enemies_in_range == []:
		walk_to_enemy()
		return

	attack()
