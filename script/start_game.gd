extends Node2D
@onready var gui: CanvasLayer = $"/root/FishManager/GUI"
@onready var fish_counter: Label = $"/root/FishManager/GUI/Fish_Counter"
@onready var sprite: Sprite2D = $"/root/FishManager/GUI/Sprite2D"
@onready var fish_counter_2: Label = $"/root/FishManager/GUI/Fish_Counter2"

func _ready() -> void:
	sprite.position = Vector2(640, 78)
	fish_counter.position = Vector2(570, 52)
	fish_counter_2.position = Vector2(572, 54)
	$fade_transition/AnimationPlayer.play("fade_out")
	gui.show()
	
var button_type = null	
	
func _on_red_button_pressed() -> void:
	print("Button Pressed")
	button_type = "red"
	$fade_transition.show()
	$fade_transition/FadeTimer.start()
	$fade_transition/AnimationPlayer.play("fade_in")
	
func _on_blue_button_pressed() -> void:
	button_type = "blue"
	$fade_transition.show()
	$fade_transition/FadeTimer.start()
	$fade_transition/AnimationPlayer.play("fade_in")




func _on_yellow_button_pressed() -> void:
	button_type = "yellow"
	$fade_transition.show()
	$fade_transition/FadeTimer.start()
	$fade_transition/AnimationPlayer.play("fade_in")


func _on_fade_timer_timeout() -> void:
	gui.hide()
	fish_counter.position = Vector2(970, 52)
	fish_counter_2.position = Vector2(972, 54)
	sprite.position = Vector2(1048, 76)
	if button_type == "red":
		get_tree().change_scene_to_file("res://scenes/indoor_red_house.tscn")
		
	elif button_type == "blue":
		get_tree().change_scene_to_file("res://scenes/indoor_blue_house.tscn")
		
	elif button_type == "yellow":
		get_tree().change_scene_to_file("res://scenes/edificio_indoor.tscn")
