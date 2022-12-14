extends Area2D

var movement = Vector2(0, 0)
var limitX = Vector2(100, 1400)
var vel = 100
var action = 0
var in_action = false

func _ready():
	$MovementTimer.start(1)

func _process(delta):
	if not in_action:
		if action == 0:
			in_action = true
			$Animation.current_animation = "swim"
			movement.x = -1
			$Sprite.flip_h = true
		if action == 1:
			in_action = true
			$Animation.current_animation = "swim"
			movement.x = 1
			$Sprite.flip_h = false
		if action == 2:
			in_action = true
			movement.x = 0
			$Animation.current_animation = "idle"

	if (self.position.x <= limitX.x) || (self.position.x >= limitX.y):
		self.position.x = clamp(self.position.x, self.limitX.x, limitX.y)
		movement.x = movement.x * -1
		$Sprite.flip_h = !$Sprite.flip_h
	self.position += vel * movement.normalized() * delta


func _on_Timer_timeout():
	action = floor(rand_range(0, 2.9))
	in_action = false
	$MovementTimer.wait_time =  floor(rand_range(2, 5))
