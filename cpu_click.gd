extends TextureButton
@onready var parent = $".."
func _on_pressed() -> void: #YOU NEED TO CONNECT THIS SIGNAL FROM THE TAB NEXT TO INSPECTOR!!
	for i in range(90):
		rotation_degrees += 1
		await get_tree().create_timer(0.01).timeout
	hide()
	parent.buttons_pressed += 1
func _ready() -> void:
	pivot_offset = size/2
	float_animation()
func float_animation() -> void:
	while true:
		for i in range(10):
			offset_top += 1
			await get_tree().create_timer(0.05).timeout

		for i in range(10):
			offset_top -= 1
			await get_tree().create_timer(0.05).timeout
