extends Spatial


# Declare member variables here. Examples:
onready var flames = $Flames
onready var smoke = $Smoke


# Called when the node enters the scene tree for the first time.
func _ready():
	flames.emitting = true
	smoke.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
