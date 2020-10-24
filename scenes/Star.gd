extends Sprite

var dying = false

func _ready():
	$AnimationPlayer.play("born")

func live():
	$AnimationPlayer.play("live")

func _on_Area2D_body_entered(body):
	if dying:
		return
	if body.name == "Player":
		body.score += 1
		$pickup.play()
	$AnimationPlayer.play("die")
	dying = true
