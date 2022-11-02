extends Area2D
var movement = Vector2(1,1)
const SPEED = 1000

var limits_DS = Vector2(1450,10)
var limits_II = Vector2(10,650)

var velocity = Vector2(0,0)

onready var time = get_node("Timer")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("despierto")	
	
	if Input.is_action_pressed("ui_up") and self.position.y > limits_DS.y:
		
		$AnimationPlayer.play("nadar")
		
		if $Sprite.flip_h == true:
			$Sprite.rotation_degrees = 45
		else:
			$Sprite.rotation_degrees = -45
		velocity.y = -SPEED
	elif Input.is_action_pressed("ui_down") and self.position.y < limits_II.y:
		$AnimationPlayer.play("nadar")
		
		if $Sprite.flip_h == true:
			$Sprite.rotation_degrees = -45
		else:
			$Sprite.rotation_degrees = 45
		velocity.y = SPEED
	else:
		$Sprite.rotation_degrees = 0
	if Input.is_action_pressed("ui_right") and self.position.x < limits_DS.x:
		$AnimationPlayer.play("nadar")
		
		velocity.x = SPEED
		if $Sprite.flip_h == true:
			$Sprite.flip_h = false
		velocity.x = velocity.x + SPEED
	elif Input.is_action_pressed("ui_left") and self.position.x > limits_II.x:
		$AnimationPlayer.play("nadar")
		
		$Sprite.flip_h = true
		velocity.x = -SPEED
		velocity.x = velocity.x - SPEED
		
		
		
	self.position += movement.normalized() * velocity * delta
	velocity = Vector2(0,0)
	
	
	
	


	
