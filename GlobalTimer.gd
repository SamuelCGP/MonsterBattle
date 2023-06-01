extends Timer

func _ready():
	timeout.connect(_on_timeout)
	Battle.time_scale_changed.connect(_on_time_scale_changed)
	wait_time = 1/Battle.time_scale if Battle.time_scale > 0 else 1.0
	start()
	
func _on_timeout():
	if Battle.time_scale <= 0: return
	get_tree().call_group("BattleMonsters", "decrease_cooldowns")

func _on_time_scale_changed():
	wait_time = 1/Battle.time_scale if Battle.time_scale > 0 else 1.0
