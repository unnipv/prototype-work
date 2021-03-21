extends RigidBody

var enabled = false
var current_object = null


var rot_x = 0
var rot_y = 0

const MOVE_SPEED = 2

var can_be_done=false

const LOOKAROUND_SPEED = 0.1

var is_right_mouse_button_down = false
var is_left_mouse_button_down = false

func _physics_process(delta):
	if enabled:
#		get_tree().call_group("AssetTree", "already_selected", true)
		move()
		scale_asset()

func _input(event):
	if(event.is_action_pressed("click") and not enabled):
		can_be_done=false
	elif(event.is_action_pressed("click") and enabled):
		can_be_done=true
	if(can_be_done==false):
		return
	if event is InputEventMouseMotion:
		current_object = get_object_under_mouse()
		if is_left_mouse_button_down == true:
			translation.x=current_object["position"].x
			translation.z=current_object["position"].z
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

func set_enabled(object):
	if self == object:
		enabled = true
	else:
		enabled = false

func move():
	if Input.is_action_just_pressed("forward"):
		translation.x+=1
	if(Input.is_action_just_pressed("backward")):
		translation.x-=1
	if(Input.is_action_just_pressed("left")):
		translation.z-=1
	if(Input.is_action_just_pressed("right")):
		translation.z+=1

func scale_asset():
	if Input.is_action_just_pressed("decrease"):
		print("scaling down")
		scale.x -=0.1
		scale.z -=0.1
		scale.y -=0.1
	if Input.is_action_just_pressed("increase"):
		scale.x +=0.1
		scale.z +=0.1
		scale.y +=0.1

func get_object_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = get_node("../../Camera").project_ray_origin(mouse_pos)
	var ray_to = ray_from + get_node("../../Camera").project_ray_normal(mouse_pos) * 1000
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection
