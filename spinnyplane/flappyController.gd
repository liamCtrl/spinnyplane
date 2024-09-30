extends Node2D

@export var rock_resource : PackedScene 
@onready var rock_timer = $rock_timer

func plane_hit() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rock_timer.start()

func _on_rock_timer_timeout() -> void:
	if rock_resource :
		var newRock = rock_resource.instantiate()
		add_child(newRock)
		if randf() < 0.5:
			newRock.position = Vector2(randf_range(0, get_viewport().size.x), 0) 
		else:
			newRock.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
		newRock.scale = Vector2(1, 1)
	else :
		print("error: no rock resource assigned")
