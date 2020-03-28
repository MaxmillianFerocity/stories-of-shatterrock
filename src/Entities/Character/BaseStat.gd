tool
extends Reference

export (int) var value : int = 0 setget set_value, get_value
export (int, -1, 999) var max_value : int = -1

signal stat_changed(value_name, value)


func set_value(new_value : int) -> void:
	value = clamp(new_value, 0, max_value) if max_value != -1 else new_value
	emit_signal("stat_changed", name, value)

func get_value() -> int:
	return value
