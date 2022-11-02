extends Light2D

func _on_BotonLuz_body_entered(body):
	self.enabled = !self.enabled
