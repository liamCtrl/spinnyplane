extends Node2D

@export var rock_resource : PackedScene 
@export var plane_resource : PackedScene
@onready var rock_timer = $rock_timer
@onready var gameover_control = $GameOver
@onready var animation_player = $GameOver/AnimationPlayer
@onready var plane_hit_sound = $sfx/thud


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func plane_hit():
	gameover_control.visible = true
	animation_player.play("slide in")
	plane_hit_sound.play()
	rock_timer.stop()

func _on_rock_timer_timeout() -> void:
	var newRock = rock_resource.instantiate()
	var screen_size = get_viewport_rect().size
	var random_x = randf_range(0, screen_size.x + 50)

	if randf() < 0.5:
		newRock.position = Vector2(random_x, 50)
		newRock.rotation = PI
	else:
		newRock.position = Vector2(random_x, screen_size.y - 50)
	add_child(newRock)


func _on_button_pressed() -> void:
	rock_timer.start()
	var newPlane = plane_resource.instantiate()
	add_child(newPlane)
	newPlane.position = Vector2(83, 319)
	gameover_control.visible = false
