extends Node3D # Or StaticBody3D, either works fine here!

@export var dialogue_label: Label

# The Doctor's heavy dialogue lines
var memory_dialogue = [
	"Doctor: Please, sit down. I have the results from your cognitive exams.\n[Press Space]",
	"Doctor: The gaps you've been experiencing... the confusion. It isn't just normal aging or stress.\n[Press Space]",
	"Doctor: I'm so sorry. The scans show early, but definitive, signs of dementia.\n[Press Space]",
	"Doctor: We need to talk about a care plan before it progresses further.\n[Press Space to wake up]"
]

var current_line = 0

func _ready():
	# 1. Lock the mouse so the player can't look away from the doctor
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	# 2. Immediately print the first line of dialogue to the screen
	if dialogue_label:
		dialogue_label.text = memory_dialogue[0]

func _process(delta):
	# Listen for the Spacebar (or Enter)
	if Input.is_action_just_pressed("ui_accept"):
		advance_dialogue()

func advance_dialogue():
	current_line += 1
	
	# If there are still lines left, show the next one
	if current_line < memory_dialogue.size():
		dialogue_label.text = memory_dialogue[current_line]
	
	# If we ran out of lines, the memory is over!
	else:
		finish_memory()

func finish_memory():
	print("Waking up from memory...")
	
	Global.medicine_memory_done = true
	Global.target_spawn_point = "Spawn_AfterMedicine"
	
	# --- NEW: UPDATE THE OBJECTIVE TO THE DOOR ---
	Global.completed_objectives.append("Find your medicines")
	Global.current_objective_index = 5 # Moves to "Answer the door"
	
	# Teleport back to the present
	get_tree().change_scene_to_file("res://Scenes/Level_01.tscn")
