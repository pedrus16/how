extends Position3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal shoot(projectile, transform)

var projectile = preload("res://projectile/projectile.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("fire"):
		emit_signal("shoot", projectile, get_global_transform())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
