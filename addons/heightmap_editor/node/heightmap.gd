@tool

extends Node3D

var mesh = ArrayMesh.new()
var resolution = Vector2(16, 16)
var size = Vector2(10, 10)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Engine.is_editor_hint():
		var surface_array = []
		surface_array.resize(Mesh.ARRAY_MAX)
		
		var vertices = PackedVector3Array()
		#var uvs = PackedVector2Array()
		#var normals = PackedVector3Array()
		#var indices = PackedInt32Array()

		for x in range(resolution.x):
			for y in range(resolution.y):
				vertices.push_back(Vector3(x, 0, y))
				vertices.push_back(Vector3((x + 1), 0, y))
				vertices.push_back(Vector3(x, 0, y + 1))
				
				vertices.push_back(Vector3(x, 0, y + 1))
				vertices.push_back(Vector3(x + 1, 0, y))
				vertices.push_back(Vector3(x + 1, 0, y + 1))
		
		surface_array[Mesh.ARRAY_VERTEX] = vertices
		#surface_array[Mesh.ARRAY_TEX_UV] = uvs
		#surface_array[Mesh.ARRAY_NORMAL] = normals
		#surface_array[Mesh.ARRAY_INDEX] = indices

		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
		var material = StandardMaterial3D.new()
		material.albedo_color = Color(1, 1, 1, 1)
		mesh.surface_set_material(0, material)
		
		var meshInstance = MeshInstance3D.new()
		meshInstance.mesh = mesh
		
		add_child(meshInstance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
