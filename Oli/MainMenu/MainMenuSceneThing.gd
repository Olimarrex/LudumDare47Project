extends Node2D


var simultaneous_scene = preload("res://main.tscn").instance()

func _add_a_scene_manually():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().get_root().add_child(simultaneous_scene)
