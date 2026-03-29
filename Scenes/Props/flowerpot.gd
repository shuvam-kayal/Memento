extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func interact():
	print("Starting Memory Scene... (Placeholder)")
	
	# Tell the global memory we picked it up
	Global.is_carrying_flowerpot = true
	
	# Delete the pot from the rooftop since it's in our hands now
	queue_free()
