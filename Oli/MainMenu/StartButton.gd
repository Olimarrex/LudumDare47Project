extends TextureRect
#
#var scene = preload("res://main.tscn");
#
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			get_tree().change_scene("res://main.tscn")
