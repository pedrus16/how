import bpy

from struct import iter_unpack, unpack

vtxFilename = "C:\\Users\\pedrus\\Workshop\\godot\\how\\extracts\\artgun\\AIRSHIP1.VTX"
facFilename = "C:\\Users\\pedrus\\Workshop\\godot\\how\\extracts\\artgun\\AIRSHIP1.FAC"


scale = 0.01

# VERTICES
vertices = []
with open(vtxFilename, "rb") as file:
    buffer = file.read()
    
for vertex in iter_unpack("hhhh", buffer):
    x, y, z, bone_index = vertex
    
    vertices.append((x * scale, y * scale, z * scale))
        
        
# FACES
faces = []
with open(facFilename, "rb") as file:
    buffer = file.read(20)
    
    reserved, triangle_count = unpack("16si", buffer)
    
    buffer = file.read(triangle_count * 32)
    
    for triangle in iter_unpack("cccccchhhhhhhihhhh", buffer):
        u_a, v_a, u_b, v_b, u_c, v_c, vertex_a, vertex_b, vertex_c, normal_a, normal_b, normal_c, _, texture_index, _, _, _, _  = triangle
        
        faces.append((vertex_a, vertex_b, vertex_c))
        
    
    buffer = file.read(4)
    
    plane_count, = unpack("i", buffer)
    
    buffer = file.read(plane_count * 36)
    
    for plane in iter_unpack("cccccccchhhhhhhhihhhh", buffer):
        u_a, v_a, u_b, v_b, u_c, v_c, u_d, v_d, vertex_a, vertex_b, vertex_c, vertex_d, normal_a, normal_b, normal_c, normal_d, texture_index, _, _, _, _  = plane
        
        faces.append((vertex_a, vertex_b, vertex_c, vertex_d))


mesh = bpy.data.meshes.new("mesh")
mesh.from_pydata(vertices, [], faces)

object = bpy.data.objects.new("model", mesh)

scene = bpy.context.scene
scene.collection.objects.link(object)

