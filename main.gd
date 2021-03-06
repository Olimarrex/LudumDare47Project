extends Node2D


var onLevel = 0
var levels = [
	'res://algo/level1.tscn',
	'res://Oli/level1floor2.tscn',
	'res://Oli/Level2/level2.tscn',
	'res://Oli/Level3.tscn',
	'res://Oli/Level3Floor2.tscn'
]

var startTime = OS.get_ticks_msec()

func nextLevel():
	print(startTime," : ", OS.get_ticks_msec()," : ", OS.get_ticks_msec()-startTime)
	get_child(1).queue_free()

	onLevel+=1
	if onLevel >= len(levels):
		print("done")
		get_tree().change_scene("res://Oli/MainMenu/MainMenuSceneThing.tscn")
	else: add_child(load(levels[onLevel]).instance())
	
