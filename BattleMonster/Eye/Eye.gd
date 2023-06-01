class_name Eye
extends Node

var isAlly: bool = true

var enemies: Array
var allies: Array

func _init(ally:bool = true):
	isAlly = ally

func see(tree):
	enemies = tree.get_nodes_in_group("Enemies" if isAlly else "Allies")
	allies = tree.get_nodes_in_group("Allies" if isAlly else "Enemies")
