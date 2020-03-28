extends ReferenceRect

export (float) var zoom_scale : float = 0.05


func get_scaled_size() -> Vector2:
	return rect_size * rect_scale


func _ready():
	set_physics_process(false)
	set_process_input(false)

func _draw() -> void:
	draw_rect(Rect2(Vector2(0,0), rect_size), Color(1,1,1,1), false)

func _input(event):
	if event.is_action_pressed("scroll_up"):
		rect_scale = Vector2(clamp(rect_scale.x + zoom_scale, 0.5, 1), clamp(rect_scale.y + zoom_scale, 0.5, 1))
	if event.is_action_pressed("scroll_down"):
		rect_scale = Vector2(clamp(rect_scale.x - zoom_scale, 0.5, 1), clamp(rect_scale.y - zoom_scale, 0.5, 1))


func _physics_process(delta):
	if Input.is_action_pressed("left_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		rect_global_position = get_global_mouse_position() - (get_scaled_size() / 2)
	elif Input.is_action_just_released("left_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	rect_global_position = Vector2(clamp(rect_global_position.x, get_parent().rect_global_position.x, get_parent().rect_size.x + get_parent().get_global_position().x - get_scaled_size().x), 
		clamp(rect_global_position.y, get_parent().rect_global_position.y, get_parent().rect_size.y + get_parent().get_global_position().y - get_scaled_size().y))