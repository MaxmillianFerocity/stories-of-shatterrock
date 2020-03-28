extends Node

const new_character : PackedScene = preload("res://src/Entities/Character/Character.tscn")
var party : Array = []



func _ready() -> void:
	for i in range(1):
		var a : Node = new_character.instance()
		
#		a.initiative = i * 3
		add_child(a)
	
	party = get_children()


func get_character(slot : int) -> Node:
	return party[slot]
