extends RigidBody2D

func _on_comida_body_entered(body):
	$AnimationPlayer.play("comida")
