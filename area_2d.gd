extends CharacterBody2D

@onready var healthbar = $EnemyHealth
@export var speed = 50
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
var hp = 100
var maxhp = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
		
		
	if player != null:
		velocity = position.direction_to(player.position)* speed
		move_and_slide()
		look_at($"../Player".position)
			
			
	
func _process(delta):
	healthbar.value = hp
	

func take_damage():
	hp -= 20
	
	if hp <= 0:
		queue_free()








func _on_area_2d_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
