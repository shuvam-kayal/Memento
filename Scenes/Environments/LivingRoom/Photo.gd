extends StaticBody3D

const MEMORY_1_SCENE = "res://Scenes/Memories/Memory_1.tscn"

func _ready() -> void:
	pass

func interact():
	get_tree().change_scene_to_file(MEMORY_1_SCENE)

func _process(_delta: float) -> void:
	pass
