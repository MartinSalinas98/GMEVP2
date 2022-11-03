extends Light2D

var on = false 

func _on_BotonLuz_body_entered(body):
	self.enabled = !self.enabled
	$LightSwitch/ClickSound.play()
	
	if on == false:
		$LightSwitch/Animation.play("on")
		$AnimationPlayerLight.play("on")
		on = true
	else:
		$LightSwitch/Animation.play("off")
		$AnimationPlayerLight.play("off")
		on = false

