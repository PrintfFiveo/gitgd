extends CollisionShape2D
@onready var hurts = $Sprite2D2/CollisionShape2D
@onready var colider = $CollisionShape2D
@onready var healthbar = $Health

func _ready():
	health = 100
	healthbar.init_health(nealth)
func _set_health(value):
	super._set_health(value)
	healthbar.health = health
func _on_hurts_area_entered(area):
	health -= 1
# Called every frame. 'delta' is the elapsed time since the previous frame.

