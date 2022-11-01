extends Area2D


export (int) var speed = 100
export (Vector2) var limits = Vector2(1480,600)
var movement = Vector2(1,0)
var movleft = false


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		$AnimationPlayer.play("nadar")		
		self.position += movement.normalized() * speed * delta
		
		if(self.position.x <= 0) || (self.position.x >= limits.x):
			self.position.x = clamp(self.position.x, 0, limits.x)
			
		
		if Input.is_action_pressed("ui_right"):
			self.rotation_degrees = 0	
			movement = Vector2(1,0)
			$Sprite.set_flip_h(false)
			movleft = false
			
		elif Input.is_action_pressed("ui_left"):
			self.rotation_degrees = 0
			movement = Vector2(-1,0)
			$Sprite.set_flip_h(true)
			movleft = true

		elif Input.is_action_pressed("ui_up"):
			if(movleft):
				self.rotation_degrees = 45
				$Sprite.set_flip_h(true)
				movement = Vector2(-1,-1)
			else:				
				self.rotation_degrees = -45
				$Sprite.set_flip_h(false)
				movement = Vector2(1,-1)
			
			
		elif Input.is_action_pressed("ui_down"):
			if(movleft):
				self.rotation_degrees = -45
				$Sprite.set_flip_h(true)
				movement = Vector2(-1,1)
			else:
				self.rotation_degrees = 45
				$Sprite.set_flip_h(false)
				movement = Vector2(1,1)
				
				

