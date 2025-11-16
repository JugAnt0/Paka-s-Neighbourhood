extends Node2D


var pointer = preload("res://assets/sprites/pointer.png")
var cat = preload("res://assets/sprites/Cat-cursor.png")

func _on_bellist_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(cat, Input.CURSOR_ARROW, Vector2(16,16))


func _on_bellist_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(pointer, Input.CURSOR_ARROW, Vector2(16,16))
