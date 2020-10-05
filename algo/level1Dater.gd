extends Node2D


var loss = false

var tileMap = [
[[-1, 0, 0],[-1, 0, 0],[-1, 0, 0], [-1, 0, 0], [-1, 0, 0], [-1, 0, 0]],
[[-1, 0, 0],[-1,-1,-1],[-1, 0,-1], [-1,-1,-1], [-1,-1,-1], [-1,-1, 0]],
[[-1, 0, 0],[-1,-1, 0],[-1, 0, 0], [-1,-1, 0], [ 4,-1, 0], [-1,-1, 0]],
[[-1, 0, 0],[-1,-1, 0],[-1, 0, 0], [-1, 9, 0], [-1, 0, 8], [-1,-1, 0]],
[[-1, 0, 0],[-1,-1,-1],[-1, 0,10], [-1,-1, 0], [-1,-1, 0], [-1,-1, 0]],
[[-1, 0, 0],[-1,-1, 0],[-1, 0, 0], [-1,-1, 0], [-1,-1, 0], [-1,-1, 0]],
[[-1, 0, 0],[-1, 0,-1],[-1, 0,-1], [-1, 0, 7], [-1, 0,-1], [-1, 0, 0]],]

var onSprighTile =  Vector2(-26, 13)
var onTile = Vector2(6,3)
var winTile = Vector2(1,4)


func unlock(id):
	if id == 7:$Node2D/mover/TileMap2.set_cell(-26, 13, 4)
	if id == 8:$Node2D/mover/deck.set_cell(-10, 7, 4)
	if id == 9:$Node2D/mover/TileMap3.set_cell(-14, 4, 3)
	if id == 10:$Node2D/mover/TileMap3.set_cell(-22, 4, 4)
	
	


func win():
	get_parent().nextLevel()

	
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
