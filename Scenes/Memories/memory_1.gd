extends Node

const LIVING_ROOM_SCENE = "res://Scenes/Environments/LivingRoom.tscn"

func show_wrong_door():
	Global.is_in_memory = true
	var wrong_door_label = find_child("WrongDoorLabel", true, false)
	if wrong_door_label != null:
		wrong_door_label.show()
		await get_tree().create_timer(1.5).timeout
		wrong_door_label.hide()
	else:
		print("Error: Could not find WrongDoorLabel!")

func enter_birthday_room():
	Global.is_in_memory = false
	get_tree().change_scene_to_file("res://Scenes/Environments/BirthdayRoom/birthday_room.tscn")
