extends KinematicBody

const LOOKAROUND_SPEED = 0.05
const MOVE_SPEED = 2

var enabled = false
var current_object = null
var can_be_done=false
var is_right_mouse_button_down = false
var is_left_mouse_button_down = false

var rot_x = 0
var rot_y = 0


func _physics_process(delta): #Actions using keyboard inputs
	if enabled:
		move()
		scale_asset()

func _input(event): #Actions using mouse
	if(event.is_action_pressed("click") and not enabled):
		can_be_done=false
	elif(event.is_action_pressed("click") and enabled):
		can_be_done=true
	if(can_be_done==false):
		return
	
	move_mouse(event)
	scale_mouse(event)
	rot_mouse(event)

#State functions
func set_enabled(object):
	if self == object:
		enabled = true
	else:
		enabled = false

func get_object_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = get_node("/root/World/Camera").project_ray_origin(mouse_pos)
	var ray_to = ray_from + get_node("/root/World/Camera").project_ray_normal(mouse_pos) * 1000
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection

#Movement functions
func move():
	if Input.is_action_just_pressed("forward"):
		translation.x+=1
	if(Input.is_action_just_pressed("backward")):
		translation.x-=1
	if(Input.is_action_just_pressed("left")):
		translation.z-=1
	if(Input.is_action_just_pressed("right")):
		translation.z+=1
	if(Input.is_action_just_pressed("move_up")):
		translation.y+=1
	if(Input.is_action_just_pressed("move_down")):
		translation.y-=1
	translation.y=clamp(translation.y,0,20)

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

func move_mouse(event):
	if event is InputEventMouseMotion:
		current_object = get_object_under_mouse()
		if is_left_mouse_button_down == true:
			var target_location = Vector3(current_object["position"].x,global_transform.origin.y,current_object["position"].z)
			global_transform.origin = get_global_transform().origin.linear_interpolate(target_location, 1)
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			is_left_mouse_button_down = event.pressed
			
func scale_mouse(event):
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

func rot_mouse(event):
	if event is InputEventMouseMotion:
		if is_right_mouse_button_down == true:
			rot_x += event.relative.x * LOOKAROUND_SPEED
			rot_y += event.relative.y * LOOKAROUND_SPEED
			var old_scale = scale
			transform.basis = Basis()
			rotate_object_local(Vector3(0, 1, 0), rot_x)
			scale = old_scale
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			is_right_mouse_button_down = event.pressed
	
