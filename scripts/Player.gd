extends KinematicBody2D

# Scene limits
const limits_DS = Vector2(1450,10)
const limits_II = Vector2(10,650)

# Object constants
export var SPEED = 500
export var SPEED_MULTIPLIER = 2

# Object initial variables
var movement = Vector2(0,0)

# Sleep timer node
onready var time = get_node("SleepTimer")

# Function that initializes the object when it enters the scene
func _ready():
	$AnimationPlayer.play("awake")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	# Initializing movement vector
	movement = Vector2(0, 0)
	
	# Calculating movement based on key presses
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		movement.y += -1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		movement.y += 1
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		movement.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		movement.x += -1
	
	# Checking animation
	if movement != Vector2.ZERO:
		$AnimationPlayer.play("swim")
		time.stop()
	else:
		if time.is_stopped():
			time.start()
			$AnimationPlayer.play("awake")
	
	# Checking frame orientation
	if movement.x < 0:
		$Sprite.flip_h = true
	elif movement.x > 0:
		$Sprite.flip_h = false
	
	# Checking frame rotation
	if movement.y < 0:
		$Sprite.rotation_degrees = 45 if $Sprite.flip_h == true else -45
	elif movement.y > 0:
		$Sprite.rotation_degrees = -45 if $Sprite.flip_h == true else 45
	else:
		$Sprite.rotation_degrees = 0
	
	# Checking if swim boost is active
	var finalSpeed = SPEED
	if Input.is_action_pressed("ui_select"):
		finalSpeed = SPEED * SPEED_MULTIPLIER
		$AnimationPlayer.playback_speed = SPEED_MULTIPLIER
	else:
		$AnimationPlayer.playback_speed = 1
	
	# Moving object
	# warning-ignore:return_value_discarded
	move_and_slide(movement.normalized() * finalSpeed)

# Function to reproduce when the timer is over
func _on_SleepTimer_timeout():
	$AnimationPlayer.play("asleep")
