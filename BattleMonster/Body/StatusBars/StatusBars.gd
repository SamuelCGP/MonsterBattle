class_name StatusBars
extends Control

@onready var health: ProgressBar = get_node("Health")
@onready var stamina: ProgressBar = get_node("Stamina")
@onready var mana: ProgressBar = get_node("Mana")

func update_progress_bar(progress_bar: ProgressBar, value: int, max_value: int):
	if not is_instance_valid(progress_bar):
		return
	progress_bar.value = value
	progress_bar.max_value = max_value
