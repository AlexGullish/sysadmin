extends TextureRect

@export var time := 0.05
var _running := false

func _ready() -> void:
	_running = true
	call_deferred("float_animation")

func _exit_tree() -> void:
	_running = false

func float_animation() -> void:
	while _running and is_inside_tree():
		for i in range(10):
			position.y += 1
			await get_tree().create_timer(time).timeout
			if !_running or !is_inside_tree(): return

		for i in range(10):
			position.y -= 1
			await get_tree().create_timer(time).timeout
			if !_running or !is_inside_tree(): return
