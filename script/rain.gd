extends Area2D
@onready var bellist: CharacterBody2D = $"../Bellist"
@onready var death_timer: Timer = $"../DeathTimer"

var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += velocity * delta

	# Delete drop when it goes offscreen
	if position.y > 800:
		queue_free()


func _on_body_entered(body):
	if body.name == "Bellist":
		Engine.time_scale = 0.2
		death_timer.start()
		

		


func _on_death_timer_timeout() -> void:
	
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/node_2d_bellist's_rain_dodge_death_scene.tscn")
