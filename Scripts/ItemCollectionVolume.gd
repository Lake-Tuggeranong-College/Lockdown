extends Node3D

var itemCount = 0
@onready var area3D = $Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	var temp = area3D.get_overlapping_bodies()
	print(temp)
	if body.has_method("getPrice"):
		if body.getPrice() > 0:
			itemCount += 1
			Global.totalValue += body.getPrice()
			if Global.myCurrentTeam == "Robber":
				Global.updatePoints()
			print(itemCount)
			print(get_tree().current_scene.totalItems)
			if get_tree().current_scene.totalItems == itemCount:
				get_tree().current_scene.totalItems = 0
				itemCount = 0
				get_tree().current_scene.resetRound()
				var bodies = area3D.get_overlapping_bodies()
				for i in bodies:
					print(bodies)
					if i.getPrice() > 0:
						i.queue_free()


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.has_method("getPrice"):
		Global.totalValue -= body.getPrice()
		if Global.myCurrentTeam == "Robber":
			Global.updatePoints()
