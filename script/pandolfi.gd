extends CharacterBody2D

const GRAVITY : int = 500
const JUMPS_PEED : int = -150
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	if is_on_floor():
		$RunCol.disabled = false
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMPS_PEED
			$AnimatedSprite2D.play("jump")
			
		elif Input.is_action_pressed( "duck"):
			$RunCol.disabled = true
			$AnimatedSprite2D.play("duck")
		
		else:
			$AnimatedSprite2D.play("run")
		
	move_and_slide()
