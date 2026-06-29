extends Node2D
@onready var themed_timer: Node2D = $MinigameTimer

var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(10.0)
	#after this is completed...
	timer_end = true 


func _process(delta: float) -> void:
	if timer_end:
		Global.minigames_done += 1
		get_tree().change_scene_to_file("res://done.tscn")



func _on_kill_zone_body_entered(body: Node2D) -> void:
	Global.lives -= 1
	Global.minigames_done = 2
	get_tree().change_scene_to_file("res://level_scene.tscn")
