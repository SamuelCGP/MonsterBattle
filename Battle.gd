extends Node

# TRIGGER LIST
signal battle_started
signal battle_ended
signal first_blood
signal time_scale_changed

@export var time_scale: float = 1 :
	set(value):
		time_scale = value if value > 0 else 0.1
		time_scale_changed.emit()
