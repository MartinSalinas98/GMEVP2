extends Area2D

var movement=Vector2()
var state = 0
var movleft = false
var randomg = floor(rand_range(-2,2))


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("normal")
	movement.x = rand_range(100, 200)
	if randomg < 0:
		movement.x = - movement.x
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Timer_timeout():
	randomg =  floor(rand_range(-2,2))
