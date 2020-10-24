extends Node2D

func _input(event):
	if event is InputEventMouse:
		look_at(event.position)
