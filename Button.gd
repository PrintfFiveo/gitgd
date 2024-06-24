extends Button
@onready var player = preload("res://player.tscn")
@onready var scene = preload("res://node_2d.tscn")

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_quit_pressed():
	get_tree().quit()


func _on_pressed():
	get_tree().change_scene_to_file("res://node_2d1.tscn")

	
	

