extends Node2D



func _ready() -> void:
	
	$fade_transition/AnimationPlayer.play("fade_out")
	
	
var button_type = null	

func _on_button_pressed() -> void:
	print("Button Pressed")
	button_type = "red"
	$fade_transition.show()
	$fade_transition/FadeTimer.start()
	$fade_transition/AnimationPlayer.play("fade_in")


func _on_fade_timer_timeout() -> void:
	if button_type == "red":
		get_tree().change_scene_to_file("res://scenes/indoor_red_house.tscn")
