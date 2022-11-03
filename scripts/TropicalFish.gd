extends "res://scripts/NPC.gd"

var fatState = 0

func _ready():
	._ready() # Super._ready()
	$Animation.play("fatState0")

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

# Function that will run when food collides with this fish
func _on_TropicalFish_body_entered(body):
	# Increasing body size each time the fish touches food
	if body.name == "Food" or body.name == "Food2":
		if fatState == 0:
			fatState = 1
			$Animation.current_animation = "fatState1"
		elif fatState == 1:
			fatState = 2
			$Animation.current_animation = "fatState2"
		elif fatState == 2:
			fatState = 3
			$Animation.current_animation = "fatState3"
		else:
			pass
