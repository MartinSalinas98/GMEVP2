extends Area2D

func _on_Oyster_body_entered(body):
	$Animation.play("open")
	$OpeningSound.play()
