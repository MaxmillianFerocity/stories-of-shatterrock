extends "../BaseManager.gd"

signal strength_changed(old_strength, new_strength)
signal enderance_changed(old_enderance, new_enderance)
signal agility_changed(old_agility, new_agility)
signal dexterity_changed(old_dexterity, new_dexterity)
signal intelligence_changed(old_intelligence, new_intelligence)
signal perception_changed(old_perception, new_perception)
signal wisdom_changed(old_wisdom, new_wisdom)
signal charisma_changed(old_charisma, new_charisma)
signal luck_changed(old_luck, new_luck)



func _init() -> void:
	stat = {
		strength = 0,
		enderance = 0,
		agility = 0,
		dexterity = 0,
		intelligence = 0,
		perception = 0,
		wisdom = 0,
		charisma = 0,
		luck = 0,
	}



func set_strength(value : int) -> void:
	stat.strength = clamp(value, 0, 100)


func set_enderance(value : int) -> void:
	stat.enderance = clamp(value, 0, 100)


func set_agility(value : int) -> void:
	stat.agility = clamp(value, 0, 100)


func set_dexterity(value : int) -> void:
	stat.dexterity = clamp(value, 0, 100)


func set_intelligence(value : int) -> void:
	stat.intelligence = clamp(value, 0, 100)


func set_perception(value : int) -> void:
	stat.perception = clamp(value, 0, 100)


func set_wisdom(value : int) -> void:
	stat.wisdom = clamp(value, 0, 100)


func set_charisma(value : int) -> void:
	stat.charisma = clamp(value, 0, 100)


func set_luck(value : int) -> void:
	stat.luck = clamp(value, 0, 100)



func get_strength() -> int:
	return stat.strength


func get_enderance() -> int:
	return stat.enderance


func get_agility() -> int:
	return stat.agility


func get_dexterity() -> int:
	return stat.dexterity


func get_intelligence() -> int:
	return stat.intelligence


func get_perception() -> int:
	return stat.perception


func get_wisdom() -> int:
	return stat.wisdom


func get_charisma() -> int:
	return stat.charisma


func get_luck() -> int:
	return stat.luck
