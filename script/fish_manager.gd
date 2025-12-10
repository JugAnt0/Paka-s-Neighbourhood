extends Node
var fish = 0
@onready var fish_counter: Label = $"/root/FishManager/GUI/Fish_Counter"
@onready var sprite: Sprite2D = $"/root/FishManager/GUI/Sprite2D"

@onready var fish_counter_2: Label = $"/root/FishManager/GUI/Fish_Counter2"




func _process(_delta: float) -> void:
	fish_counter.text = str(fish)
	fish_counter_2.text = str(fish)
	
