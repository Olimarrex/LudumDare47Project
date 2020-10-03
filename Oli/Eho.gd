extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("ui_right")):
		$".".position += Vector2(10, 0)
	pass
	if(Input.is_action_pressed("ui_left")):
		$".".position += Vector2(-10, 0)
	pass
	if(Input.is_action_pressed("ui_down")):
		$".".position += Vector2(0, 10)
	pass
	if(Input.is_action_pressed("ui_up")):
		$".".position += Vector2(0, -10)
	pass
pass
