extends VBoxContainer

func _ready() -> void:
	connect("sort_children", self, "_on_sort_children")


func _on_sort_children() -> void:
	var children