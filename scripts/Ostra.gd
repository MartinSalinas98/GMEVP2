extends Area2D


func _on_Ostra_area_entered(area):
	$AnimationPlayer.play("open")
	
