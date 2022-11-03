extends KinematicBody2D

# Defining different states
enum {
	IDLE,
	WANDER
}

# Defining world constants
const CANVAS_LENGTH = 1600
const CANVAS_HEIGHT = 800
const MOVING_SPEED = 60
const RANDOM_MOVEMENT_DISPLACEMENT = 400
const MOVEMENT_PROBABILITY = 0.0005
const DESTINATION_TOLERANCE = 5.0

# Defining object constants
const FISH_LENGTH = 160
const FISH_HEIGHT = 75

# Defining initial states
var velocity = Vector2.ZERO
var state = IDLE
var movement = Vector2.ZERO
var destination = self.position
var toleranceVector = Vector2(DESTINATION_TOLERANCE, DESTINATION_TOLERANCE)
var objectRotation = 0

# Function to randomly move
func get_random_new_position():
	# Randomly selecting if object will move or not
	var willMove = false
	if MOVEMENT_PROBABILITY == 1:
		willMove = true
	else:
		if MOVEMENT_PROBABILITY != 0:
			willMove = true if rand_range(0, 1) < MOVEMENT_PROBABILITY else false
	
	# If object should move, generate new coordinates, or else return current position
	if not willMove or state == WANDER:
		return Vector2.ZERO
	else:
		# Change state to wandering
		state = WANDER
		
		# Checking limits for random displacement
		var limitX = Vector2(0 - self.position.x + (FISH_LENGTH/2.0), CANVAS_LENGTH - self.position.x - (FISH_LENGTH/2.0))
		var limitY = Vector2(0 - self.position.y + (FISH_HEIGHT/2.0), CANVAS_HEIGHT - self.position.y - (FISH_HEIGHT/2.0))
		
		# Generating random movement vector inside limits
		return Vector2(
			clamp(int(rand_range(-RANDOM_MOVEMENT_DISPLACEMENT, RANDOM_MOVEMENT_DISPLACEMENT)), limitX.x, limitX.y),
			clamp(int(rand_range(-RANDOM_MOVEMENT_DISPLACEMENT, RANDOM_MOVEMENT_DISPLACEMENT)), limitY.x, limitY.y)
		)

# Function that calculates sprite rotation and velocity given a displacement vector
func prepare_movement(displacement):
	# Play moving animation
	$AnimationPlayer.play("nadar")
	
	# Calculating moving direction, destination location and tolerance vector
	var movingLeft = true if displacement.x < 0 else false
	var movingUp = true if displacement.y < 0 else false
	destination = self.position + displacement
	toleranceVector = Vector2(
		DESTINATION_TOLERANCE if movingLeft else -DESTINATION_TOLERANCE,
		DESTINATION_TOLERANCE if movingUp else -DESTINATION_TOLERANCE
	)
	
	# Calculating rotation angle
	objectRotation = atan(displacement.y/displacement.x)
	$Sprite.rotate(objectRotation)
	
	# If moves to left, flip sprite
	if movingLeft:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	
	# Calculate speed directions
	velocity = Vector2(
		MOVING_SPEED if movingUp else -MOVING_SPEED,
		MOVING_SPEED if movingLeft else -MOVING_SPEED
	)

# Called when the node enters the scene tree for the first time.
func _ready():
	# Start idle animation
	$AnimationPlayer.play("quieto")

func _physics_process(delta):
	if state == IDLE:
		# If object is idle, decide if it should randomly move
		movement = get_random_new_position()
		
		# If returned position is current, it means object should not move
		if movement == Vector2.ZERO:
			pass
		else:
			# Calculating velocity and rotation
			prepare_movement(movement)
	else:
		# Move object
		self.position += movement.normalized() * Vector2(MOVING_SPEED, MOVING_SPEED) * delta
		
		# If already reached destination within tolerance, stop moving and return to normal conditions
		if self.position < (destination + toleranceVector) and self.position > (destination - toleranceVector):
			state = IDLE
			$Sprite.rotate(-objectRotation)
			$AnimationPlayer.play("quieto")
			velocity = Vector2.ZERO
