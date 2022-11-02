extends Area2D

var movement = Vector2(0, 0)
var limitX = Vector2(0, 1500)
var vel = 50
var action = 0
var in_action = true

func _ready():
	$Timer.start(1)
	in_action = false

func _process(delta):
	if not in_action:
		if action == 0:
			in_action = true
			$AnimationPlayer.current_animation = "swim"
			movement.x = -1
			$Sprite.flip_h = true
		if action == 1:
			in_action = true
			$AnimationPlayer.current_animation = "swim"
			movement.x = 1
			$Sprite.flip_h = false
		if action == 2:
			in_action = true
			$AnimationPlayer.current_animation = "iddle"

	if (self.position.x <= limitX.x) || (self.position.x >= limitX.y):
		self.position.x = clamp(self.position.x, self.limitX.x, limitX.y)
		movement.x = movement.x * -1
		$Sprite.flip_h = !$Sprite.flip_h
	self.position += vel * movement.normalized() * delta


func _on_Timer_timeout():
	action = floor(rand_range(0, 2.9))
	in_action = false
	$Timer.wait_time =  floor(rand_range(2, 5))

