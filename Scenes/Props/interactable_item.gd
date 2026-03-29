extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# This function gets called by the player when they press E
func interact():
	print("You interacted with the Teddy Bear!")
	# Later, we can add code here to play a sound or add it to an inventory

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
