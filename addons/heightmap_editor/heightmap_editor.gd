@tool
extends EditorPlugin

const PLUGIN_NAME = "heightmap_editor"

func _enable_plugin() -> void:
	EditorInterface.set_plugin_enabled(PLUGIN_NAME + "/node", true)
	EditorInterface.set_plugin_enabled(PLUGIN_NAME + "/panel", true)


func _disable_plugin() -> void:
	EditorInterface.set_plugin_enabled(PLUGIN_NAME + "/node", false)
	EditorInterface.set_plugin_enabled(PLUGIN_NAME + "/panel", false)
