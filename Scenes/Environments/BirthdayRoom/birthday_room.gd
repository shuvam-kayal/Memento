extends Node

func _ready():
	Global.current_memory = 2
	Global.completed_objectives.append("Clean the table(Get Cloth from second room in top floor)")
	Global.current_objective_index = 3
	await get_tree().create_timer(10.0).timeout
	Global.target_spawn_point = "SpawnFromLivingRoom"
	get_tree().change_scene_to_file("res://Scenes/Level_01.tscn")
