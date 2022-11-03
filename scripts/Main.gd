extends Node2D

# warning-ignore:unused_argument
func _on_comida_body_entered(body):
	var play = $comida.get_node("AnimationPlayer")
	play.play("comida")
