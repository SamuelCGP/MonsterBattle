class_name FireSwordEffect
extends ItemEffect

func _init():
	trigger = "hit"
	effect = item_effect

func equip_effect(factor: int):
	linked_monster.damage += 35 * factor
	linked_monster.attack_stamina_cost += 10 * factor
	print("equip effect")

func item_effect(enemy_hit: BattleMonster):
	enemy_hit.health_regen = -10
	enemy_hit.modulate = Color(0.8, 0.5, 0, 1)
	print("hit effect to ", enemy_hit)
