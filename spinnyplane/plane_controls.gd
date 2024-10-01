extends RigidBody2D

@onready var plane_sprite = $plane_animated_sprite

func _ready() -> void:
	var velocity = Vector2(200, 0) 
	linear_velocity = velocity

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("flap") :
		print("flap")
		apply_force(Vector2(0, -25000), Vector2.ZERO)
		plane_sprite.play("flap")


func _on_plane_animated_sprite_animation_finished() -> void:
	if plane_sprite.animation == "flap":
		plane_sprite.play("glide")
		
