extends Sprite

export var deng = 0.01

func _ready():
	$Timer.wait_time = deng
	$Timer.start()

func _on_Timer_timeout():
	$Bye.play("bye-tail")
