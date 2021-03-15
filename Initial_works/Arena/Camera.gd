extends Camera

var mouse_sensitivity=800
#func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	if(Input.is_action_just_pressed("camera_forward")):
		translation.z-=1
	if(Input.is_action_just_pressed("camera_backward")):
		translation.z+=1
	if(Input.is_action_just_pressed("camera_left")):
		translation.x-=1
	if(Input.is_action_just_pressed("camera_right")):
		translation.x+=1
	if(Input.is_action_just_pressed("camera_up")):
		translation.y+=1
	if(Input.is_action_just_pressed("camera_down")):
		translation.y-=1
		
#func _input(event):
#	if event is InputEventMouseMotion:
#		rotation=h_camera_rotation(-event.relative.x/mouse_sensitivity)
#		rotation=v_camera_rotation(-event.relative.y/mouse_sensitivity)
#
#func h_camera_rotation(camera_rotation):
#	return rotation+Vector3(0,camera_rotation,0)
#
#
#func v_camera_rotation(camera_rotation):
#	var rot= rotation+Vector3(camera_rotation,0,0)
#	return rot
