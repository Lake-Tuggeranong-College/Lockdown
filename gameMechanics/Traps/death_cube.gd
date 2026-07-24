extends Node3D

var dangerous = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func becomeDangerous(): 
	var material = $MeshInstance3D.get_active_material(0)
	
	if dangerous == true:
		dangerous = false
		material.albedo_color = Color(0.133, 1.0, 0.0, 1.0)      
	elif dangerous == false:
		dangerous = true   
		material.albedo_color = Color(1.0, 0.0, 0.741, 1.0)          

func _on_death_cube_area_body_entered(body: Node3D) -> void:
	if dangerous == true:
		print ("OH DEAR")
	elif dangerous == false:
		print ("everythings fine")
