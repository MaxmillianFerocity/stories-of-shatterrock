extends Node

var character : Node
var is_selected : bool = false setget set_is_selected

signal path_requested(point_one, point_two, node)
signal character_selected(character)

onready var state_machine : Node = ($PathMaker/PathFollower/StateMachine as Node)
onready var path_maker : Path2D = ($PathMaker as Path2D)
onready var path_follower : PathFollow2D = ($PathMaker/PathFollower as PathFollow2D)



func request_path() -> void:
	var point_one : Vector2 = path_follower.global_position
	var point_two : Vector2 = path_follower.get_global_mouse_position()
	
	if path_maker.path_actual.size() > 0:
		point_one = path_maker.path_actual[-1]
	
	emit_signal("path_requested", point_one, point_two, self)



func set_is_selected(value : bool) -> void:
	is_selected = value
	if is_selected:
		state_machine.set_current_state("selected")
	else:
		state_machine.set_current_state("idle")


func set_character_position(new_position : Vector2) -> void:
	path_follower.set_global_position(new_position)


func set_path_color(new_color : Color) -> void:
	path_maker.path_color = new_color



func _on_path_sent(node : Node, path : Array) -> void:
	if not node == self:
		print(str(name, ": Path ignored, not mine"))
		return
	
	var actual : Array = path[1]
	var mapped : Array = path[0]
	
	path_maker.add_path(actual, mapped)
