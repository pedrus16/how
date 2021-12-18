extends KinematicBody


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var moveSpeed = 300
var backwardSpeedRatio = 0.5
var strafeSpeedRatio = 0.5
var jumpSpeed = 200
var acceleration = 10

var _velocity = Vector3.ZERO
var snapVector = Vector3.DOWN

var _lastMoveDirection = Vector2.ZERO
var _lerpMoveDirection = Vector2.ZERO
var _lerpMoveDirectionStart = Vector2.ZERO
var _t = 0

onready var pivot: Spatial = $Pivot
onready var animationTree: AnimationTree = $Pivot/Model/AnimationTree

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var velocity = _velocity

	if is_on_floor():
		var moveDirection = Input.get_vector("move_left", "move_right", "move_forward", "move_back")

		# TODO Improve acceleration because it feels mushy right now, it should be depending on a speed rate and not
		# TODO Lerp actual velocity and not the thumbstick direction 
		_t += delta * acceleration
		if moveDirection.distance_to(_lastMoveDirection) > 0.1:
			_t = 0
			_lerpMoveDirectionStart = _lerpMoveDirection
			_lastMoveDirection = moveDirection

		_lerpMoveDirection  = _lerpMoveDirectionStart.linear_interpolate(moveDirection, min(_t, 1))

		velocity.x = _lerpMoveDirection.x * strafeSpeedRatio * moveSpeed * delta
		velocity.z = _lerpMoveDirection.y * moveSpeed * delta
		if velocity.z > 0:
			velocity.z *= backwardSpeedRatio
		velocity = velocity.rotated(Vector3.UP, pivot.rotation.y)

		if Input.is_action_just_pressed("jump"):
			velocity.y = jumpSpeed * delta
			snapVector = Vector3.ZERO
		elif snapVector == Vector3.ZERO:
			snapVector = Vector3.DOWN

		animationTree.set("parameters/run_blend/blend_amount", velocity.length() / (moveSpeed * delta))
	else:
		velocity.y -= gravity * delta
		animationTree.set("parameters/run_blend/blend_amount", 0)


	_velocity = move_and_slide_with_snap(velocity, snapVector, Vector3.UP, true)
