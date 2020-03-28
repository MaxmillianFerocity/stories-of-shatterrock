extends Resource

enum TraitType {UNDEFINED, PASSIVE, ACTIVE}

export (TraitType) var type : int = TraitType.UNDEFINED
export (String, MULTILINE) var description : String = String()
export (Dictionary) var modifiers : Dictionary = {}
var is_active : bool = false


func _init():
	if type == TraitType.PASSIVE:
		is_active = true

func get_modifiers() -> Dictionary:
	return modifiers