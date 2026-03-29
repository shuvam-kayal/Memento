extends StaticBody3D

func interact():
	# 1. Check if the Old Lady is actually holding it
	if Global.is_carrying_flowerpot == true:
		print("Placing flowerpot!")
		
		# 2. Update Global memory so it disappears from her hands
		Global.is_carrying_flowerpot = false
		
		# 3. Un-hide our fake table pot!
		$HeldFlowerpot.visible = true
		
		# 4. Turn off this hitbox so she can't click the empty air again
		$CollisionShape3D.disabled = true
	else:
		print("I need to find the flowerpot first.")
