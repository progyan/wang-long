extends Node2D

var star = preload("res://scenes/Star.tscn")

func _on_Timer_timeout():
	randomize()
	var twinkle = star.instance()
	twinkle.global_position = Vector2((randi() % 4300) - 1000, (randi() % 2400) - 1900)
	add_child(twinkle)
