extends Area2D

func _on_Ostra_body_entered(body):
	$AnimationPlayer.play("open")
