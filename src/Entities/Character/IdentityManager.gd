extends "BaseManager.gd"

signal name_changed(new_name)
signal race_changed(new_race)
signal age_changed(new_age)
signal eye_color_changed(new_color)
signal hair_color_changed(new_color)
signal birth_place_changed(new_location)
signal residence_changed(new_location)
signal deity_changed(new_deity)



func _init() -> void:
	stat = {
		name = "John Everyman",
		race ="res://assets/Resources/Races/Human.tres",
		age = 18,
		eye_color = Color(0, 0, 1),
		hair_color = Color(0.2, 0, 0),
		birth_place = "",
		residence = "",
		deity = "",
	}



func set_name(new_name : String) -> void:
	stat.name = new_name
	emit_signal("name_changed", stat.name)


func set_race(new_race : Resource) -> void:
	stat.race = new_race
	emit_signal("race_changed", stat.race)


func set_age(new_age : int) -> void:
	stat.age = new_age
	emit_signal("age_changed", stat.age)


func set_eye_color(new_color : Color) -> void:
	stat.eye_color = new_color
	emit_signal("eye_color_changed", stat.eye_color)


func set_hair_color(new_color : Color) -> void:
	stat.hair_color = new_color
	emit_signal("hair_color_changed", stat.hair_color)


func set_birth_place(new_place : String) -> void:
	stat.birth_place = new_place
	emit_signal("birth_place_changed", stat.birth_place)


func set_residence(new_residence : String) -> void:
	stat.residence = new_residence
	emit_signal("residence_changed", stat.residence)


func set_deity(new_deity : String) -> void:
	stat.deity = new_deity
	emit_signal("deity_changed", stat.deity)



func get_name() -> String:
	return stat.name


func get_race() -> Resource:
	return stat.race


func get_age() -> int:
	return stat.age


func get_eye_color() -> Color:
	return stat.eye_color


func get_hair_color() -> Color:
	return stat.hair_color


func get_birth_place() -> String:
	return stat.birth_place


func get_residence() -> String:
	return stat.residence


func get_deity() -> String:
	return stat.deity
