class_name Instinct
extends Resource

var monster: BattleMonster
var nearest_enemy: BattleMonster : 
	get:
		if monster.eye.enemies == null:
			return null

		var nearest: BattleMonster
		var first_time: bool = true

		for enemy in monster.eye.enemies:
			if first_time:
				nearest = enemy
				first_time = false
			else:
				if enemy.position.x + monster.position.x < nearest.position.x + monster.position.x \
				and enemy.position.y + monster.position.y < nearest.position.y + monster.position.y:
					nearest = enemy

		return nearest
var enemies_in_range: Array[Node2D] : 
	get:
		var all_in_range = monster.attack_range_area.get_overlapping_bodies()
		var local_enemies_in_range: Array[Node2D] = []
		
		var index := 0
		for body in all_in_range:
			var is_monster = true if "monster_resource" in body else false
			if is_monster:
				if body.is_ally == !monster.is_ally:
					local_enemies_in_range.append(all_in_range[index])
			index += 1

		return local_enemies_in_range

func walk_to_enemy(enemy: BattleMonster = nearest_enemy):
	if enemy == null: return
	
	var x_direction = 1 if floor(enemy.position.x) > floor(monster.position.x) else \
					-1 if floor(enemy.position.x) < floor(monster.position.x) else 0
	var y_direction = 1 if floor(enemy.position.y) > floor(monster.position.y) else \
					-1 if floor(enemy.position.y) < floor(monster.position.y) else 0
	
	monster.velocity = Vector2(monster.speed * x_direction, monster.speed * y_direction)
	
	#applying time scale
	monster.velocity *= Battle.time_scale
	
	monster.move_and_slide()

func attack(enemy: BattleMonster = nearest_enemy):
	if monster.attack_cooldown == 0 && monster.stamina >= monster.attack_stamina_cost:
		
		enemy.health -= monster.damage
		monster.stamina -= monster.damage
		monster.attack_cooldown = monster.attack_delay
		# emitting signal
		monster.hit.emit(enemy)
