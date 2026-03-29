extends StaticBody3D

const MEMORY_0_SCENE = "res://Scenes/Memories/Memory_0.tscn"

func _ready() -> void:
	pass

# Called by the player when they press E
func interact():
	get_tree().change_scene_to_file(MEMORY_0_SCENE)

func _process(_delta: float) -> void:
	pass
