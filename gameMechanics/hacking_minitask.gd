extends Node2D

@onready var player_scene = preload("res://gameMechanics/2d_player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player():
	var new_player = player_scene.instantiate()
	new_player.global_position = $SpawnPoint.global_position
	add_child(new_player)
