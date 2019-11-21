extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var armor = 4 setget set_armor
const Laser = preload('res://Laser.tscn')

signal armor_channged

# Called when the node enters the scene tree for the first time.
func _ready():
	
	add_to_group('ship')
	$Timer.connect('timeout', self, 'shoot')
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	position.x = clamp(get_global_mouse_position().x, 16, 164)
	
	if Input.is_action_just_pressed("ui_up"):
		shoot();

func set_armor(value):
	armor = value
	emit_signal('armor_channged', armor)
	if armor < 1:
		queue_free()

func create_laser(positon):

	var laser = Laser.instance()
	laser.position = position
	get_tree().root.add_child(laser)

func shoot():

	create_laser($Cannons/Left.global_position)
	create_laser($Cannons/Right.global_position)