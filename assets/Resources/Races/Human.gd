extends "RaceTemplate.gd"


func _init() -> void:
	race_name = "Human"
	race_description = """One of the first sapient species 
	in any world. Gods typically favor the humans as a starting 
	point since they are very adaptable and flexible to work with. 
	It’s unknown where they came from, through most leads point 
	towards the planet of Shatterrock."""
	racial_traits = [load_trait("Racial/Human/Versatility.gd")]
