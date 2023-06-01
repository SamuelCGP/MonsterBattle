class_name Brain
extends Node

var isAlly: bool
var monster: BattleMonster

func _init(linked_monster: BattleMonster):
	monster = linked_monster
	isAlly = linked_monster.monster_resource.is_ally

func initial_config():
	monster.add_to_group("BattleMonsters")
	monster.add_to_group("Allies" if isAlly else "Enemies")
	
func think():
	if not monster.instinct: return
	
	monster.instinct.instinct(monster)
