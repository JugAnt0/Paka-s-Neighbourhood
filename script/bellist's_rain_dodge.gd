extends Node2D

@onready var bellist := $Bellist
@onready var spawner := $Spawner
@onready var timer := $Spawner/SpawnTimer
@onready var rain_template := $Rain   # Hidden template in the scene

func _ready() -> void:
	# Make sure the template is hidden and NEVER freed
	rain_template.visible = false
	rain_template.set_physics_process(false)
	rain_template.set_process(false)

	# Start timer
	timer.start()


func _on_spawn_timer_timeout() -> void:
	# Safety check: ensure the template still exists
	if rain_template == null or !is_instance_valid(rain_template):
		print("Rain template was freed! (Error)")
		return
	
	# Duplicate a new falling object
	var drop = rain_template.duplicate()

	# IMPORTANT: Enable the node because the template is disabled
	drop.visible = true
	drop.set_physics_process(true)
	drop.set_process(true)

	# Random spawn position
	drop.position = Vector2(
		randi_range(-230, 230),   # adjust spawn area width
		-50                    # above the screen
	)

	# Add the drop to the scene
	add_child(drop)

	# Make it fall automatically
	drop.set("velocity", Vector2(0, 50))   # Requires a velocity property in Rain script




	
