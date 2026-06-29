extends Node2D
@onready var player: CharacterBody2D = $"../Player" # grabs the parent node
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"
@onready var sprite: TextureRect = $CPU
# make a signal
signal cpu_collected
func _ready() -> void:
	float_animation()
func _process(delta: float) -> void: # this runs EVERY FRAME! 
	if player_area.overlaps_area(self_area): # checks if overlapping
		if self.visible:
			emit_signal("cpu_collected") #signal broadcast
			self.hide() #removed from player sight; collected
		
func float_animation() -> void:
	while true:
		for i in range(10):
			sprite.position.y -= 1
			await get_tree().create_timer(0.05).timeout

		for i in range(10):
			sprite.position.y += 1
			await get_tree().create_timer(0.05).timeout
