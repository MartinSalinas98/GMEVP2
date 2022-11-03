extends "res://scripts/NPC.gd"

var gordo = 0 

func _process(delta):
	if not in_action:
		if action == 0:
			in_action = true
			movement.x = -1
			$Sprite.flip_h = true
		if action == 1:
			in_action = true
			movement.x = 1
			$Sprite.flip_h = false
		if action == 2:
			in_action = true
			movement.x = 0

	if (self.position.x <= limitX.x) || (self.position.x >= limitX.y):
		self.position.x = clamp(self.position.x, self.limitX.x, limitX.y)
		movement.x = movement.x * -1
		$Sprite.flip_h = !$Sprite.flip_h
	self.position += vel * movement.normalized() * delta


func _on_Food_input_event(viewport, event, shape_idx):
	print("Como")
	if gordo == 0:
		gordo = 1
		$Animation.current_animation = "gordo1"
	elif gordo == 1:
		gordo = 2
		$Animation.current_animation = "gordo2"
	elif gordo == 2:
		gordo = 3
		$Animation.current_animation = "gordo3"
	elif gordo == 3:
		gordo = 4
		$Animation.current_animation = "gordo4"
