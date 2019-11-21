extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Enemy = preload('res://Enemy.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn():

	var enemy = Enemy.instance()
	enemy.position.x = rand_range(16, 164)
	add_child(enemy)