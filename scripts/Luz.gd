extends Light2D

func _on_BotonLuz_area_entered(area):
	self.enabled = !self.enabled
