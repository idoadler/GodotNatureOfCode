extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if(Input.is_action_just_pressed("click")): 
		var m_pos = get_viewport().get_mouse_position()
		var unit = load("res://alien.tscn").instance()
		add_child(unit)
		unit.position = m_pos 
