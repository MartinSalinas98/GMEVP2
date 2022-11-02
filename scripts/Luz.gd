extends Light2D

var on = false

func _on_BotonLuz_body_entered(body):
	self.enabled = !self.enabled
	if on == false:
		$BotonLuz/AnimationPlayer.play("on")
		on=true
	else:
		$BotonLuz/AnimationPlayer.play("off")
		on=false
