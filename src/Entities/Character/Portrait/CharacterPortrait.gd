extends Control

onready var overlay : Control = ($Picture/Portrait/Overlay as Control)


func _ready():
	overlay.connect("gui_input", self, "_on_Overlay_gui_input")


func _on_Overlay_gui_input(event : InputEvent) -> void:
	if event.is_action_pressed("left_mouse") and not has_node("PhotoSelecter"):
		var photo_selecter : PackedScene = load("res://Entities/Character/Portrait/PhotoSelecter.tscn")
		add_child(photo_selecter.instance())
		get_node("PhotoSelecter").connect("file_selected", self, "_on_PhotoSelecter_file_selected")
		get_node("PhotoSelecter").connect("popup_hide", self, "_on_PhotoSelecter_popup_hide")
		get_node("PhotoSelecter").popup()

func _on_PhotoSelecter_file_selected(path : String) -> void:
	var photo_cropper : PackedScene = load("res://Entities/Character/Portrait/PhotoCropper.tscn")
	var selected_photo : Texture = load(path)
	print(selected_photo)
	add_child(photo_cropper.instance())
	get_node("PhotoCropper").set_photo(selected_photo)
	get_node("PhotoCropper").connect("portrait_created", self, "_on_PhotoCropper_portrait_created", [], 1)
	get_node("PhotoCropper").popup()

func _on_PhotoSelecter_popup_hide() -> void:
	get_node("PhotoSelecter").queue_free()

func _on_PhotoCropper_portrait_created(photo : Texture) -> void:
	($Picture as Control).set_photo(photo)
	get_node("PhotoCropper").queue_free()