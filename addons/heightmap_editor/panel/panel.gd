@tool
extends EditorPlugin

var panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _enter_tree() -> void:
	panel = preload("panel.tscn").instantiate()
	add_control_to_bottom_panel(panel, "Heightmap Editor")


func _exit_tree() -> void:
	remove_control_from_bottom_panel(panel)
	panel.free()
	
