extends Light2D

var on = false

# warning-ignore:unused_argument
func _on_BotonLuz_body_entered(body):
	self.enabled = !self.enabled
	$LightSwitch/ClickSound.play()
	if on == false:
		$LightSwitch/LightSwitchAnimation.play("on")
		$LightBulbAnimation.play("on")
		on = true
	else:
		$LightSwitch/LightSwitchAnimation.play("off")
		$LightBulbAnimation.play("off")
		on = false
