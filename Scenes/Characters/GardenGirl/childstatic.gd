extends StaticBody3D

@export var dialogue_label: Label
@export var confused_model: Node3D # We will plug the first model in here!
@export var joy_model: Node3D      # We will plug the second model in here!

var intro_dialogue = [
	"Child: Mom, what kind of plant is this? It looks thirsty.\n[Press Space]",
	"You: That's a forget-me-not, sweetie. You're right, it needs a drink.\n[Press Space]",
	"You: Let me go find the little green sprinkler.\n[Find the Sprinkler]"
]

var completion_dialogue = [
	"Child: Yay! You found it! Can I water it?\n[Press Space]",
	"You: Of course. Go ahead, give it some life.\n[Press Space to finish memory]"
]

var quest_stage = 0
var dialogue_index = 0

func _ready():
	if dialogue_label:
		dialogue_label.text = intro_dialogue[0]
		
	# Safety check: Force the correct models to show/hide when the scene starts!
	if confused_model and joy_model:
		confused_model.visible = true
		joy_model.visible = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		advance_dialogue()

func advance_dialogue():
	if quest_stage == 0:
		dialogue_index += 1
		if dialogue_index < intro_dialogue.size():
			dialogue_label.text = intro_dialogue[dialogue_index]
		else:
			quest_stage = 1
			dialogue_label.text = "" 
			
	elif quest_stage == 2:
		dialogue_index += 1
		if dialogue_index < completion_dialogue.size():
			dialogue_label.text = completion_dialogue[dialogue_index]
		else:
			finish_memory()

func interact():
	if quest_stage == 1:
		if Global.is_carrying_sprinkler == true:
			# Success! Start final dialogue
			quest_stage = 2
			dialogue_index = 0
			dialogue_label.text = completion_dialogue[0]
			
			# THE MAGIC TRICK: Swap the models!
			if confused_model and joy_model:
				confused_model.visible = false
				joy_model.visible = true
		else:
			dialogue_label.text = "You: I should look for the sprinkler first before we water it."

func finish_memory():
	print("Memory complete. Returning to roof...")
	Global.is_carrying_sprinkler = false
	Global.is_carrying_flowerpot = true
	Global.target_spawn_point = "Spawn_AfterMemory"
	get_tree().change_scene_to_file("res://Scenes/Environments/RoofTop/rooftop.tscn")
