extends Node2D


func _ready():
	print(str(OS.get_ticks_msec() - get_parent().get_parent().startTime))
	$Label.text = str(stepify(float(OS.get_ticks_msec()-get_parent().get_parent().startTime)/1000.0, 0.001))

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		get_parent().next()
