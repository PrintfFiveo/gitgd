extends CharacterBody2D
class_name character_body_2D

const SPEED = 300.0
const SPEED2 = -400.0
const JUMP_VELOCITY = -400.0

@onready var healthbar = $Camera2D/Health

#stats player
var hp = 100
var maxhp = 100

func die():
	print("Player is dead!")
	get_tree().change_scene_to_file("res://menu.tscn")
	

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func take_damage(): 
	hp -= 10

func _physics_process(delta):


	if hp <= 0:
		die()
	
	healthbar.value = hp
	
	 
	# Add the gravity.
	###if not is_on_floor():
	###if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	##	velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	

	
	var player_state
	var direction = Input.get_vector("left_mov", "right_mov", "up_mov", "down_mov")
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
		$AnimationPlayer.pause()
		
	else:
		$AnimationPlayer.play("new_animation")
	if direction.x != 0 or direction.y != 0:
		player_state = "walk"
		$AnimationPlayer.play("new_animation")
		velocity =  direction * SPEED
	else:
		$AnimationPlayer.stop()
		player_state = "idle"



	if direction.y < 0 and player_state == "walk" :
		$AnimatedSprite2D.play("idle_back")
	else:
		$AnimatedSprite2D.play("idle_front")
	
	velocity =  direction * SPEED

	move_and_slide()



	
	

 








func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("take_damage"):
		body.take_damage()


func _on_area_2d_body_entered(body):
	take_damage()
