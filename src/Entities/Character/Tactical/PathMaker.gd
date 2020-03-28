extends Path2D

var path_actual : PoolVector2Array = []
var path_mapped : PoolVector2Array = []
var path_current : PoolVector2Array = []

var path_color : Color = Color(0, 0, 1)

signal path_requested(point_one, point_two, node)

onready var path_follower : PathFollow2D = ($PathFollower as PathFollow2D)



func _draw() -> void:
	if path_mapped.size() >= 2:
		draw_polyline(path_mapped, path_color, 2)
	for i in path_actual:
		draw_circle(i, 3, path_color)



func update_path() -> void:
	curve.clear_points()
	
	for i in path_mapped:
		curve.add_point(i)
	
	update()


func add_path(actual : Array, mapped : Array) -> void:
	if path_actual.size():
		if actual[1] == path_actual[-1]:
			return
	
	for i in mapped:
		path_mapped.append(i)
	for i in actual:
		path_actual.append(i)
	
	path_current.append(path_mapped[0])
	path_current.append(path_mapped[1])
	
	update_path()


func remove_points_on_path(path : Array, start : int, end : int) -> PoolVector2Array:
	var new_mapped_path : Array = path.duplicate(true)
	new_mapped_path.invert()
	
	for i in range(end, start, -1):
		new_mapped_path.remove(i)
	
	new_mapped_path.invert()
	return PoolVector2Array(new_mapped_path)


func remove_point() -> void:
	if not path_actual.size() > 0:
		return
	
	var start_idx : int = Array(path_mapped).find_last(path_actual[-2])
	var end_idx : int = Array(path_mapped).find_last(path_actual[-1]) + 1
	
	if path_actual.size() < 2:
		path_actual.remove(0)
	else:
		path_actual.remove(path_actual.size() - 2)
	path_actual.remove(path_actual.size() - 1)
	
	remove_points_on_path(path_mapped, start_idx, end_idx)
	update_path()


func _on_PathFollower_point_reached() -> void:
	print("point_reached")
