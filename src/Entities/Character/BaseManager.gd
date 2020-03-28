tool
extends Node

# All stats are kepted in a dictionary. This allows custom stats to be added.
var stat : Dictionary = {}

signal stat_changed(stat_name, new_value, old_value)


# General use functions for custom stats. Use the built-in functions for official
# stats.
func is_same_type(value_one, value_two) -> bool:
	var type_one : int = typeof(value_one)
	var type_two : int = typeof(value_two)
	
	if not type_one == type_two:
		print_debug("Types do not match (", type_one, " vs. ", type_two)
		return false
	
	return true


# Add or subtracts the stat by the value provided. Use only for stat with
# integers and min/max values.
func change_stat(stat_name : String, value : int, min_value : int, max_value : int) -> void:
	if not is_same_type(stat[stat_name], value):
		return
	
	set_stat(stat_name, clamp(get_stat(stat_name) + value, min_value, max_value))



func set_stat(stat_name : String, value) -> void:
	if not is_same_type(stat[stat_name], value):
		return
	
	var old_value = stat[stat_name]
	stat[stat_name] = value
	emit_signal("stat_changed", stat_name, value, old_value)



func get_stat(stat_name : String):
	return stat.get(stat_name, "hackfraudery")
