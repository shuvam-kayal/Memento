extends Node
func enter_birthday_room():
	# 1. Define the path to the scene you just saved in Step 1
	var next_scene_path = "res://Scenes/Environments/House/birthday_room.tscn"
	
	# 2. Tell the game tree to load and switch to that file
	get_tree().change_scene_to_file(next_scene_path)
