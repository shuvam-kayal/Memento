extends Node

const LIVING_ROOM_SCENE = "res://Scenes/Environments/LivingRoom.tscn"

func _ready():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file(LIVING_ROOM_SCENE)
