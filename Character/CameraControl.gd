extends Position3D


var MOUSE_SENSITIVITY = 0.005

onready var springArm: SpringArm = $SpringArm


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			get_tree().quit()
	elif event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation.y -= event.relative.x * MOUSE_SENSITIVITY
		rotation.y = wrapf(rotation.y, 0, 2 * PI)

		springArm.rotation.x -= event.relative.y * MOUSE_SENSITIVITY
		springArm.rotation_degrees.x = clamp(springArm.rotation_degrees.x, -90, 45)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
