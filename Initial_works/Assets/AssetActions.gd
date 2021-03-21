extends RigidBody

var rot_x = 0
var rot_y = 0

const MOVE_SPEED = 2

var can_be_done=false

const LOOKAROUND_SPEED = 0.1

var is_right_mouse_button_down = false
var is_left_mouse_button_down = false

var current_object = null

func _process(delta):
	pass
	
func _input(event):
	var getobject=get_object_under_mouse()
	if(event.is_action_pressed("click") and getobject.size()>0 and getobject["collider"]!=self):
		can_be_done=false
	elif(event.is_action_pressed("click") and getobject.size()>0 and getobject["collider"]==self):
		can_be_done=true
#		get_tree().call_group("AssetTree", "already_selected", true)
		print("group called")
	if(can_be_done==false):
		return
		
#	if current_object != null:
#		getobject = current_object
#		current_object = null
		
	if event is InputEventMouseMotion:
		if is_left_mouse_button_down == true and (getobject.size()==0 or getobject["collider"]!=self):
			translation.x=getobject["position"].x
			translation.z=getobject["position"].z
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			is_left_mouse_button_down = event.pressed
	if event is InputEventMouseButton:
		if(event.button_index==BUTTON_WHEEL_UP):
			scale.x+=(0.1)
			scale.y+=(0.1)
			scale.z+=(0.1)
			scale.x=clamp(scale.x,0.5,4)
			scale.y=clamp(scale.y,0.5,4)
			scale.z=clamp(scale.z,0.5,4)
		if(event.button_index==BUTTON_WHEEL_DOWN):
			scale.x-=(0.1)
			scale.y-=(0.1)
			scale.z-=(0.1)
			scale.x=clamp(scale.x,0.5,4)
			scale.y=clamp(scale.y,0.5,4)
			scale.z=clamp(scale.z,0.5,4)
	if event is InputEventMouseMotion:
		if is_right_mouse_button_down == true:
			rot_x += event.relative.x * LOOKAROUND_SPEED
			rot_y += event.relative.y * LOOKAROUND_SPEED
			transform.basis = Basis()
			rotate_object_local(Vector3(0, 1, 0), rot_x)
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			is_right_mouse_button_down = event.pressed


func get_object_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = get_node("../../Camera").project_ray_origin(mouse_pos)
	var ray_to = ray_from + get_node("../../Camera").project_ray_normal(mouse_pos) * 1000
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection
	
func set_enabled(object):
	current_object = object
	print("object set to")
	print(current_object)
