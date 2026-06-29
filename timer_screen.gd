extends Node2D
@onready var CPU_container: HBoxContainer = $CPU_container
@onready var CPU: TextureRect = $CPU_container/CPU
@onready var CPU_2: TextureRect = $CPU_container/CPU2
@onready var CPU_3: TextureRect = $CPU_container/CPU3
@onready var CPU_4: TextureRect = $CPU_container/CPU4
@onready var CPU_5: TextureRect = $CPU_container/CPU5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file("res://minigames/minigame_" + str(Global.minigames_done)+".tscn")

func _process(delta: float) -> void:
	match Global.lives:
		4:
			CPU.hide()
		3:
			CPU.hide()
			CPU_2.hide()
		2:
			CPU.hide()
			CPU_2.hide()
			CPU_3.hide()
		1:
			CPU.hide()
			CPU_2.hide()
			CPU_3.hide()
			CPU_4.hide()
		0:
			CPU_container.hide()
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)
func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
