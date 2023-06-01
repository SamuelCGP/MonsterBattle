class_name AttackRange
extends Area2D

@onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")

var area_range: int = 1 :
	set(value):
		if is_instance_valid(collision_shape):
			collision_shape.shape.radius = 100 + ((value-1) * 25)
		area_range = area_range

func _ready():
	area_range = area_range
