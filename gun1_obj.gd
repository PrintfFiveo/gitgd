extends Area2D


# Called when the node enters the scene tree for the first time.
const bullet = preload("res://bullet_obj.tscn")
const node_2d = preload("res://node_2d.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.


###func _ready():
	

func _physics_process(delta):
	
	look_at(get_local_mouse_position())
	const bullet = preload("res://bullet_obj.tscn")
	var new_bullet = bullet.instantiate() 
	new_bullet.position = $gun_pivot/pistol/shooting_Point.position
	new_bullet.rotation = $gun_pivot/pistol/shooting_Point.global_rotation 
	
	
	if Input.is_action_pressed("Click"):
		$Timer.start()
		add_sibling(new_bullet)
	








func _on_timer_timeout():
	set_physics_process(false) 
	if _physics_process(false):
		$Timer.start()
