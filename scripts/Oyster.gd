extends Area2D

# warning-ignore:unused_argument
func _on_Oyster_body_entered(body):
	$Animation.play("open")
	$OpeningSound.play()
