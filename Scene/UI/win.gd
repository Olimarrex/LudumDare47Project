extends Node2D

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		get_parent().next()
