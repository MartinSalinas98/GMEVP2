extends Area2D

# Function that will be entered when a fish enters in contact with the oyster
func _on_Ostra_body_entered(body):
	$AnimationPlayer.play("open")
