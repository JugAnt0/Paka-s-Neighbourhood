extends Node2D

const MOUSE = preload("uid://deowjibv8av4d")

var You_found_an_easter_egg = "Congrats!"

const POINTER = preload("uid://dgjrvxgmrf0lq")


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Input.set_custom_mouse_cursor(POINTER, Input.CURSOR_ARROW, Vector2(16,16))
		get_tree().change_scene_to_file("res://scenes/start_game.tscn")


func _on_area_2d_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(MOUSE, Input.CURSOR_ARROW, Vector2(16,16))


func _on_area_2d_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(POINTER, Input.CURSOR_ARROW, Vector2(16,16))
