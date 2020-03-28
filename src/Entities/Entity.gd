extends Node


func clear_children(node : Node = self) -> void:
	if Engine.editor_hint:
		for child in node.get_children():
			child.free()

func add_node(node : Node, name : String, child : Node = self, allow_duplicates : bool = false) -> void:
	if Engine.editor_hint:
		if not allow_duplicates and not has_node(node.name):
			return
		node.name = name
		child.add_child(node, true)
		node.set_owner(self)

func add_scene(scene : String, child : Node = self, allow_duplicates : bool = false) -> void:
	if Engine.editor_hint:
		var new_scene : Node = load(scene).instance()
		if not allow_duplicates and has_node(new_scene.name):
			return
		child.add_child(new_scene, true)
		new_scene.set_owner(self)

# When setting up types for your entity, overwrite this function
# and use call_deferred to call this function from the type's setter function
# when the node is ready. Otherwise, there will be unintended behavior.
func _set_type(new_type : int) -> void:
	return
