extends Area2D

# Function that will be entered when a fish enters in contact with the oyster
func _on_Oyster_area_entered(area):
	$Animation.play("open")
	$OpeningSound.play()
