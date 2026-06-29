extends CharacterBody2D


const SPEED = 500.0
func _ready() -> void:
	velocity = Vector2(randf_range(-0.5,0.5), 1.0).normalized() * SPEED

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
