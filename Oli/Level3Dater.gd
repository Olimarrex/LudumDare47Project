extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal nextLevel

var loss = false

var tileMap = [
[[ -1,-1,-1],[-1, 0,-1],[-1,-1,-1],[-1, 0,-1],[-1, 0,-1],[-1,-1, 0]],
[[ -1,-1, 0],[-1, 0, 0],[ 6, 0, 0],[-1, 0,-1],[ 7, 0,-1],[-1,-1, 0]],
[[ -1,-1, 0],[-1, 0, 0],[-1,-1, 0],[-1,-1, 0],[-1, 0, 0],[-1,-1, 0]],
[[ -1, 0,-1],[-1, 0,-1],[ 5, 0, 0],[-1, 0,-1],[-1, 0,-1],[-1, 0, 0]],]

var onSprighTile =  Vector2(-14, 22)
var onTile = Vector2(3,5)
var winTile = Vector2(1,4)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func unlock(id):
	print("open: ", id)
	if id == 1:$Node2D/mover/TileMap3.set_cell(-2, 19, 3)
	if id == 2:$Node2D/mover/TileMap2.set_cell(-14, 16, 3)
	if id == 3:$Node2D/mover/TileMap3.set_cell(-26, 7, 8)
	if id == 4:$Node2D/mover/TileMap2.set_cell(-26, 1, 13)
	if id == 5:$Node2D/mover/TileMap2.set_cell(-22, 4, 3)
	
	
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
