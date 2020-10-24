extends AnimatedSprite

func _ready():
	play("default")
	$AnimationPlayer.play("New Anim")

func _on_Timer_timeout():
	queue_free()
