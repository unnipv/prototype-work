extends Spatial

var mouse_inside = false
var pos = Vector3()

func _input(event):
	if event is InputEventMouseButton and event.is_doubleclick():
		var object = get_object_under_mouse()
		print("clicked")
		if object.size()>0 and $Assets.is_a_parent_of(object["collider"]):
			get_tree().call_group("Assets", "set_enabled", object["collider"])
			print(object["collider"])
		else:
#			print(object)
			if object.size()>0:
					get_tree().call_group("Assets", "set_enabled", object["collider"])

func get_object_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = $Camera.project_ray_origin(mouse_pos)
	var ray_to = ray_from + $Camera.project_ray_normal(mouse_pos) * 1000
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection
