extends Node2D

@onready var gui: CanvasLayer = $"/root/FishManager/GUI"
@onready var bellist := $Bellist
@onready var spawner := $Spawner
@onready var timer := $Spawner/SpawnTimer
@onready var rain_template := $Rain   

func _ready() -> void:
	gui.show()
	
	rain_template.visible = false
	rain_template.set_physics_process(false)
	rain_template.set_process(false)
	timer.start()
	
	
func _on_spawn_timer_timeout() -> void:
	if rain_template == null or !is_instance_valid(rain_template):
		print("Rain template was freed! (Error)")
		return
		
	var drop = rain_template.duplicate()
	
	drop.visible = true
	drop.set_physics_process(true)
	drop.set_process(true)
	
	
	drop.position = Vector2(
		randi_range(-230, 230), 
		-50                    
	)
	add_child(drop)
	drop.set("velocity", Vector2(0, 100))   
	
