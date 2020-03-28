extends "../State.gd"


func _enter() -> void:
	print(str(owner.name, " is now selected"))


func _handle_input(event) -> void:
	if event.is_action_released("left_mouse"):
		owner.request_path()
	if event.is_action_pressed("space_bar"):
		emit_signal("state_finished", "moving")
