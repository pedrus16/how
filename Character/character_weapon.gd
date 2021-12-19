extends KinematicBody


signal shoot(projectile, direction, location)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Weapon_shoot(projectile, direction, location):
	emit_signal("shoot", projectile, direction, location)
