extends Light2D

var on = false 

func _on_BotonLuz_body_entered(body):
	self.enabled = !self.enabled
	
	if on == false:
		$LightSwitch/AnimationPlayer.play("on")
		on = true
	else:
		$LightSwitch/AnimationPlayer.play("off")
		on = false

