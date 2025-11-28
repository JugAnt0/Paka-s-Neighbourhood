extends CharacterBody2D
@onready var cam: Camera2D = $"../Camera2D"

const GRAVITY := 900.0
const JUMP_SPEED := -500.0
const MOVE_SPEED := 200.0

func _physics_process(delta: float) -> void:
	# Gravity
	velocity.y += GRAVITY * delta

	# Horizontal movement
	var input_dir := Input.get_axis("ui_left", "ui_right")
	velocity.x = input_dir * MOVE_SPEED

	# Apply movement (uses CharacterBody2D.velocity internally)
	move_and_slide()

	# Respawn if falling too far
	if global_position.y > 800:
		global_position = Vector2(200, 200)
		velocity = Vector2.ZERO
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
	# SCREEN WRAP
	var left_limit := -144
	var right_limit := 144 # change to your viewport width

	if global_position.x > right_limit:
		global_position.x = left_limit
	elif global_position.x < left_limit:
		global_position.x = right_limit
	

	if global_position.y > cam.global_position.y + 200:
		get_tree().change_scene_to_file("res://scenes/flora's_sky_high_death_screen.tscn")





func _on_area_2d_body_entered(body: Node2D) -> void:
	if velocity.y > 0:  # Only bounce if falling
		velocity.y = JUMP_SPEED
