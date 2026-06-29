extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var mouse_x = get_global_mouse_position().x
	global_position.x = mouse_x
