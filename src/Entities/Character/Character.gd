extends Node

enum Controller {PLAYER, NON_PLAYER}
enum StatType {IDENTITY, BASE, ATTRIBUTE, SKILL, PROFICIENCY}

export (Controller) var type
export (Resource) var preset setget set_preset

onready var identity_manager : Node = ($IdentityManager as Node)
onready var stat_manager : Node = ($StatManager as Node)
onready var attribute_manager : Node = ($AttributeManager as Node)



func _ready() -> void:
	attribute_manager.connect("strength_changed", self, "_on_AttributeManager_strength_changed") 
	attribute_manager.connect("enderance_changed", self, "_on_AttributeManager_enderance_changed") 
	attribute_manager.connect("agility_changed", self, "_on_AttributeManager_agility_changed") 
	attribute_manager.connect("dexterity_changed", self, "_on_AttributeManager_dexterity_changed") 
	attribute_manager.connect("intelligence_changed", self, "_on_AttributeManager_intelligence_changed") 
	attribute_manager.connect("perception_changed", self, "_on_AttributeManager_perception_changed") 
	attribute_manager.connect("wisdom_changed", self, "_on_AttributeManager_wisdom_changed") 
	attribute_manager.connect("charisma_changed", self, "_on_AttributeManager_charisma_changed") 
	attribute_manager.connect("luck_changed", self, "_on_AttributeManager_luck_changed") 




func roll(value : int = 0) -> int:
	return (randi() % 100 + 1) + value



func set_preset(value : Resource) -> void:
	preset = value
