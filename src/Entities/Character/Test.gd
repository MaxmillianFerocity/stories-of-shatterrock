extends Node

class Stat:
	extends Reference
	
	var stat_name : String = ""
	var stat_description : String = ""
	var max_value : int = 0
	var value : int = 0
	
	signal stat_changed(stat_name, old_value, new_value)
	
	
	
	func set_value(new_value : int):
		var old_value : int = value
		value = new_value
		emit_signal("stat_changed", stat_name, old_value, get_value())
	
	
	
	func get_value() -> int:
		return value



class Skill:
	extends Stat
	
	enum Type {ACCURACY, CRAFTING, DOCTOR, ESPIONAGE, INSTINCT, KNOWLEDGE, SOCIAL,
			SPEECHCRAFT, SURVIVAL}
	
	var skill_type : int
	
	
	
	func roll() -> int:
		return (randi() % 100 + 1) + value
	
	
	func determine_awards() -> PoolIntArray:
		var a : PoolIntArray = []
		var x : int = 1
		
		for i in range(0, 150, 25):
			if value > i:
				a.append(x)
			x += 1
		
		return a
