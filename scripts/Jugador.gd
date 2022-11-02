extends KinematicBody2D

# Scene limits
const limits_DS = Vector2(1450,10)
const limits_II = Vector2(10,650)

# Object constants
const SPEED = 1000

# Object initial variables
var movement = Vector2(0,0)

onready var time = get_node("Timer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Initializing movement vector
	movement = Vector2(0, 0)
	
	# Calculating movement based on key presses
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		movement.y += -1
		#if $Sprite.flip_h == true:
		#	$Sprite.rotation_degrees = 45
		#else:
		#	$Sprite.rotation_degrees = -45
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		movement.y += 1
		#if $Sprite.flip_h == true:
		#	$Sprite.rotation_degrees = -45
		#else:
		#	$Sprite.rotation_degrees = 45
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		movement.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		movement.x += -1
	
	# Checking animation
	if movement != Vector2.ZERO:
		$AnimationPlayer.play("nadar")
	else:
		$AnimationPlayer.play("despierto")
	
	# Checking frame orientation and rotation
	if movement.x < 0:
		$Sprite.flip_h = true
		$Sprite.rotation_degrees = 45 if movement.y < 0 else -45
	else:
		$Sprite.flip_h = false
		$Sprite.rotation_degrees = -45 if movement.y < 0 else 45
	# Overwriting rotation if needed
	if movement.y == 0:
		$Sprite.rotation_degrees = 0
	
	# Moving object
	move_and_slide(movement.normalized() * SPEED)
