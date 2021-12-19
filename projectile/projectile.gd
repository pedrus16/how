extends RigidBody


onready var shell = $shell

var explosion = preload("res://projectile/explosion.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if linear_velocity.length() > 0.1:
		shell.look_at(translation + -linear_velocity, Vector3.UP)


func _on_RigidBody_body_entered(body):
	var e = explosion.instance()
	get_parent().add_child(e)
	e.translation = translation
	queue_free()
