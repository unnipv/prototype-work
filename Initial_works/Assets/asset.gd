extends StaticBody

var enabled = false
var current_object = null

func _physics_process(delta):
	if enabled:
		move()
		scale()

func move():
	if Input.is_action_just_pressed("forward"):
		translation.x+=1
	if(Input.is_action_just_pressed("backward")):
		translation.x-=1
	if(Input.is_action_just_pressed("left")):
		translation.z-=1
	if(Input.is_action_just_pressed("right")):
		translation.z+=1
		
func scale():
	if Input.is_action_just_pressed("decrease"):
		print("scaling down")
		scale.x -=0.1
		scale.z -=0.1
		scale.y -=0.1
	if Input.is_action_just_pressed("increase"):
		scale.x +=0.1
		scale.z +=0.1
		scale.y +=0.1

func set_enabled(object):
	if self == object:
		enabled = true
	else:
		enabled = false
