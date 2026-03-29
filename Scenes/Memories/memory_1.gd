extends Node

const LIVING_ROOM_SCENE = "res://Scenes/Environments/LivingRoom.tscn"


# --- ADD EVERYTHING BELOW THIS LINE ---

func show_wrong_door():
	# This searches the entire scene for the label, ignoring strict paths!
	# The 'false' at the end is important—it tells Godot to look inside instanced scenes too.
	var wrong_door_label = find_child("WrongDoorLabel", true, false)
	
	# We add a quick safety check so it never crashes again
	if wrong_door_label != null:
		wrong_door_label.show()
		await get_tree().create_timer(1.5).timeout
		wrong_door_label.hide()
	else:
		# If it fails, it will print this to your Output window instead of crashing
		print("Error: Could not find the WrongDoorLabel node!")
		# If it fails, it will print this to your Output window instead of crashing
		print("Error: Could not find the WrongDoorLabel node!")
