extends Area2D

func _on_comida_body_entered(body):
	var play = $comida.get_node("AnimationPlayer")
	play.play("comida")
