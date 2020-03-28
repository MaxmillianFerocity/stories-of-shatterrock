extends Node

export(NodePath) var START_STATE : NodePath

var current_state : Node
var state_map : Dictionary = {}
var is_ai_controlled : bool = false setget set_ai_controlled

var _active : bool = false setget set_active

signal state_changed(new_state, previous_state)



func _ready() -> void:
	state_map = {
		idle = $Idle,
		selected = $Selected,
		moving = $Moving,
	}
	
	if not START_STATE:
		START_STATE = get_children()[0].get_path()
	
	for child in get_children():
		child.connect("state_finished", self, "set_current_state")
	
	_change_state(get_node(START_STATE))


func _unhandled_input(event: InputEvent) -> void:
	current_state._handle_input(event)


func _unhandled_key_input(event: InputEventKey) -> void:
	current_state._handle_key_input(event)


func _physics_process(delta: float) -> void:
	current_state._handle_physics_process(delta)


func _process(delta: float) -> void:
	current_state._handle_process(delta)


func _change_state(new_state : Node) -> void:
	if current_state:
		current_state._exit()
	current_state = new_state
	current_state._enter()
	emit_signal("state_changed", current_state)



func set_current_state(new_state : String) -> void:
	_change_state(state_map[new_state])


func set_ai_controlled(value : bool) -> void:
	is_ai_controlled = value
	set_process_unhandled_input(value)
	set_process_unhandled_key_input(value)


func set_active(value : bool) -> void:
	_active = value
	set_process(_active)
	set_physics_process(_active)
