extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Pig_shoot(projectile, transform):
	var p = projectile.instance()
	add_child(p)
	p.transform = transform
	p.linear_velocity = -transform.basis.z * 10 # TODO Get direction from rotation
