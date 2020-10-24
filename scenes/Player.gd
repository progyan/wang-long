extends KinematicBody2D

var bullet = preload("res://scenes/Bullet.tscn")
var tail_sc = preload("res://scenes/Tail.tscn")

var speed = 500
var pew_cost = 3
var pew_spd = 1000

var score = 0

export var dragon = "fuzang"

var costume

onready var tails = get_parent().get_node("Tails")

func _ready():
	if dragon == "fuzang":
		costume = load("res://art/龙门/赴藏龙/tail.png")
		$Sprite.frames = load("res://animations/FuZang.tres")
		set_collision_layer(1)
	elif dragon == "qing":
		costume = load("res://art/龙门/青龙/tail.png")
		$Sprite.frames = load("res://animations/Qing.tres")
		pew_spd = 1400
	elif dragon == "huang":
		costume = load("res://art/龙门/黄龙/tail.png")
		$Sprite.frames = load("res://animations/Huang.tres")
		pew_cost = 2
	elif dragon == "fei":
		costume = load("res://art/龙门/飞龙/tail.png")
		$Sprite.frames = load("res://animations/Fei.tres")
		$Fei.play("fei")
		$Wings.show()
		speed = 700
	else:
		push_error("Do you know a new type of a 王龙?")

func _input(event):
	if event is InputEventMouse:
		look_at(event.position + global_position - Vector2(128, 75))
	var just_pressed = event.is_pressed() and not event.is_echo()
	if (Input.is_key_pressed(KEY_SPACE) or event is InputEventMouseButton) and just_pressed and score >= pew_cost:
		var bull = bullet.instance()
		bull.global_position = $Mouth.global_position
		bull.global_rotation_degrees = global_rotation_degrees + 90
		bull.speed = pew_spd
		get_parent().get_node("Explosions").add_child(bull)
		score -= pew_cost
		$pew.play()

func _physics_process(delta):
	move_and_slide(Vector2(speed, 0).rotated(global_rotation))

func _process(delta):
	randomize()
	
	var tail = tail_sc.instance()
	tail.global_position = $Tail.global_position
	tail.deng = float(score) / 50 + 0.01
	tail.texture = costume
	tail.modulate = modulate
	
	#var sc = Vector2(0.5, 0.5)
	#scale = sc
	
	get_parent().get_node("Tails").add_child(tail)
	#tail.scale = sc
	
	if randi() % 100 == 1:
		$Sprite.play("blink")
	if randi() % 10 == 1:
		$Sprite.play("default")
	
	$GUI/Label.text = str(score)
