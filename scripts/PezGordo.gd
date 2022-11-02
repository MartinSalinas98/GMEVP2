extends Area2D

var movement=Vector2(0,0)
var state = 0
var movleft = false
var randomg = 0
var vel=Vector2(1,1)


func _random(delta):
	$AnimationPlayer.play("normal")
	movement.x = floor(rand_range(100, 200))
	if randomg < 0:
		movement.x = -movement.x	
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
		
	self.position += vel.normalized() * movement * delta		


func _on_Timer_timeout(delta):
	randomg =  floor(rand_range(-2,2))
	print(randomg)


func _process(delta):
	_random(delta)	

