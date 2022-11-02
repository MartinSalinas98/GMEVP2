extends Area2D
var movement = Vector2(1,1)
const SPEED = 100

var limits_DS = Vector2(1100,-180)
var limits_II = Vector2(-260,500)

var velocity = Vector2(0,0)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("nadar")
	
	if Input.is_action_pressed("ui_up") and self.position.y > limits_DS.y:
		if $Sprite.flip_h == true:
			$Sprite.rotation_degrees = 45
		else:
			$Sprite.rotation_degrees = -45
		velocity.y = -SPEED
	elif Input.is_action_pressed("ui_down") and self.position.y < limits_II.y:
		if $Sprite.flip_h == true:
			$Sprite.rotation_degrees = -45
		else:
			$Sprite.rotation_degrees = 45
		velocity.y = SPEED
	else:
		$Sprite.rotation_degrees = 0
	if Input.is_action_pressed("ui_right") and self.position.x < limits_DS.x:
		velocity.x = SPEED
		if $Sprite.flip_h == true:
			$Sprite.flip_h = false
		velocity.x = velocity.x + SPEED
	elif Input.is_action_pressed("ui_left") and self.position.x > limits_II.x:
		$Sprite.flip_h = true
		velocity.x = -SPEED
		velocity.x = velocity.x - SPEED
	self.position += movement.normalized() * velocity * delta
	velocity = Vector2(0,0)












