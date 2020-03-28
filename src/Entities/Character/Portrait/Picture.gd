extends PanelContainer

onready var portrait : TextureRect = ($Portrait as TextureRect)
onready var label : Label = ($Portrait/Label as Label)
onready var fade : ColorRect = ($Portrait/Overlay as ColorRect)

var photo : Texture setget set_photo


func _ready():
	portrait.texture = photo
	fade.connect("mouse_entered", self, "_on_Fade_mouse_entered")
	fade.connect("mouse_exited", self, "_on_Fade_mouse_exited")


func set_photo(new_photo : Texture) -> void:
	photo = new_photo
	portrait.texture = photo


func _on_Fade_mouse_entered():
	label.visible = true
	fade.color = Color(0,0,0,0.5)

func _on_Fade_mouse_exited():
	label.visible = false
	fade.color = Color(0,0,0,0)