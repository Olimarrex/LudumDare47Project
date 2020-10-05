extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal nextLevel

var loss = false

var tileMap = [
[[ -1,-1,-1],[-1, 0,-1],[-1, 0,-1],[-1,20,-1],[-1,-1,-1]],
[[ -1,-1,18],[-1,19,-1],[-1, 0,-1],[-1, 0,-1],[-1, 0, 0]],
[[ -1,-1, 0],[-1,-1, 0],[-1, 0, 0],[-1, 0, 0],[-1, 0, 0]]]

var onSprighTile =  Vector2(-18, 7)
var onTile = Vector2(0,4)
var winTile = Vector2(0,3)

func unlock(id):
	print("open: ", id)
	if id == 18:$Node2D/mover/Wall.set_cell(-38, -2, 47, true)
	if id == 19:$Node2D/mover/Wall.set_cell(-34, 1, 47)
	if id == 20:$Node2D/mover/Wall3.set_cell(-22, 4, 47)

	
	
func win():
	print("you win!")
	$UI.queue_free()
	$Node2D.queue_free()
	$AudioStreamPlayer.queue_free()
	$Player.queue_free()
	add_child(load("res://Scene/UI/win.tscn").instance())

func next():
	print('next')
	emit_signal("nextLevel")
	get_parent().nextLevel()

func loos():
	print("you loos")
	$UI.queue_free()
	$Node2D.queue_free()
	$AudioStreamPlayer.queue_free()
	$Player.queue_free()
	add_child(load("res://Scene/UI/lost.tscn").instance())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
