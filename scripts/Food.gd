extends RigidBody2D

# Defining state variables
var eaten = false
var initialPosition
var shouldReset = false

# Function executed the first time
func _ready():
	initialPosition = self.position

# Function executed every time the tropical fish touches the food
func _on_TropicalFish_body_entered(body):
	if body.name == self.name:
		eaten = true
		$Animation.play("food")
		$Hitbox.set_deferred("disabled", true)

# Function that will reset the food position and states
func _integrate_forces(state):
	if shouldReset:
		state.transform = Transform2D(0, initialPosition)
		state.linear_velocity = Vector2()
		$Hitbox.set_deferred("disabled", false)
		$Sprite.frame = 0
		shouldReset = false

# Changing food state to be reset
func _on_World_asked_for_food():
	shouldReset = true
