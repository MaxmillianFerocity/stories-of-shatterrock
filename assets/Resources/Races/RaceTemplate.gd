extends Resource

export (String) var race_name : String = String()
export (String, MULTILINE) var race_description : String = String()
export (Dictionary) var attribute_modifiers : Dictionary = {}
export (Dictionary)var skill_modifiers : Dictionary = {}
export (Array) var racial_traits : Array = []


func load_trait(trait_path : String) -> Resource:
	return load(str("res://Resources/Traits/", trait_path))
