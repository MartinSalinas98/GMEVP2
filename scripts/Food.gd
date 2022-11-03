extends RigidBody2D

# warning-ignore:unused_argument
func _on_comida_body_entered(body):
	$AnimationPlayer.play("comida")
