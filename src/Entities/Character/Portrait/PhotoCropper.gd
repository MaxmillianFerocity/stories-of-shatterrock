extends PopupPanel

export (float) var zoom_speed : float = 0.05

onready var selected_photo : TextureRect = ($VBoxContainer/HBoxContainer/SelectedPhoto as TextureRect)
onready var preview_photo : TextureRect = ($VBoxContainer/HBoxContainer/PreviewPhoto as TextureRect)
onready var crop_box : ReferenceRect = ($VBoxContainer/HBoxContainer/SelectedPhoto/CropBox as ReferenceRect)
onready var update_timer : Timer = ($UpdateTimer as Timer)

var photo : Texture = preload("res://Entities/Character/Portrait/Westly_Willows.PNG") setget set_photo
var photo_name : String = "Unnamed"

signal portrait_created(path)


func _ready():
	selected_photo.connect("mouse_entered", self, "_on_SelectedPhoto_mouse_entered")
	selected_photo.connect("mouse_exited", self, "_on_SelectedPhoto_mouse_exited")
	update_timer.connect("timeout", self, "_on_UpdateTimer_timeout")
	($VBoxContainer/Button/Cancel as Button).connect("button_up", self, "_on_Cancel_button_up")
	($VBoxContainer/Button/Create as Button).connect("button_up", self, "_on_Create_button_up")


func set_photo(new_photo : Texture) -> void:
	photo = new_photo
	selected_photo.texture = photo

func rotate_image_180(image : Image) -> Image:
	image.flip_x()
	image.flip_y()
	return image


func _on_UpdateTimer_timeout() -> void:
	var new_image : Image = get_viewport().get_texture().get_data()
	var texture : ImageTexture = ImageTexture.new()
	
	new_image.flip_y()
	new_image.crop(crop_box.rect_global_position.x + crop_box.get_scaled_size().x, 
			crop_box.rect_global_position.y + crop_box.get_scaled_size().y)
	
	new_image = rotate_image_180(new_image)
	new_image.crop(crop_box.get_scaled_size().x - 1, crop_box.get_scaled_size().y - 1)
	new_image = rotate_image_180(new_image)
	
	texture.create_from_image(new_image)
	preview_photo.texture = texture

func _on_SelectedPhoto_mouse_entered() -> void:
	crop_box.set_physics_process(true)
	crop_box.set_process_input(true)

func _on_SelectedPhoto_mouse_exited() -> void:
	crop_box.set_physics_process(false)
	crop_box.set_process_input(false)

func _on_Create_button_up() -> void:
	var path : String = str("res://PlayerCharacters/Portraits/", photo_name, ".PNG")
	update_timer.stop()
	preview_photo.texture.get_data().save_png(path)
	emit_signal("portrait_created", preview_photo.texture)

func _on_Cancel_button_up() -> void:
	queue_free()