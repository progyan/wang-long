extends KinematicBody2D

var explosion = preload("res://scenes/Explosion.tscn")

export var speed = 1000

func _physics_process(delta):
	move_and_slide(Vector2(speed, 0).rotated(global_rotation - deg2rad(90)))

func _on_Area2D_body_entered(body):
	var boom = explosion.instance()
	boom.global_position = global_position
	get_parent().add_child(boom)
	queue_free()
