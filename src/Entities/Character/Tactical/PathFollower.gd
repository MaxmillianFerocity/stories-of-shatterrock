extends PathFollow2D


func move() -> void:
	if not unit_offset >= 1:
		offset += 1
	
	for i in get_parent().path_mapped:
		if global_position == i:
			emit_signal("point_reached")
			break


func turn() -> void:
	return
