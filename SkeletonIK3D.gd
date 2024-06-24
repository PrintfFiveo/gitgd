extends SkeletonIK3D



@onready var healthbar = $EnemyHealth
@export var speed = 400
@onready var player = $"../Player"
var target_position = (player.position - position).normalized()
# Called when the node enters the scene tree for the first time.
var hp = 100
var maxhp = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	if position.distance_to(player.position > 2):
		look_at($"../Player".position)
		move_and_slide(target_position * speed)
	
func _process(delta):
	healthbar.value = hp
	

func take_damage():
	hp -= 20
	
	if hp <= 0:
		queue_free()



