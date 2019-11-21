extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocity = Vector2(0, 100)
export var armor = 1 setget set_armor


# Called when the node enters the scene tree for the first time.
func _ready():
	
	connect('area_entered', self, '_on_hit')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position += velocity * delta

	if position.y >= 336:
		queue_free()

		
func _on_hit(other):

	if other.is_in_group('ship'):
		other.armor -= 1
		queue_free()

func set_armor(value):

	armor = value
	emit_signal('armor_channged', armor)
	if armor < 1:
		queue_free()
