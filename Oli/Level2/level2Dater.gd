extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tileMap = [
[[ -1, 0, 0],[-1, 0, 0],[-1, 0, 0],[-1, 0, 0],[-1, 0, 0],[-1, 0, 0],[-1, 0, 0],[-1, 0, 0],[-1, 0, 0],[-1, 0, 0]],
[[ -1, 0, 0],[-1, 0, 0],[-1,-1,-1],[-1,-1,-1],[-1, 0,-1],[-1, 0,-1],[-1,-1,-1],[-1, 0,-1],[-1,-1, 0],[-1, 0, 0]],
[[ -1, 0, 0],[ 1,-1,-1],[-1, 4, 0],[-1, 5, 0],[-1, 0, 0],[-1, 0, 0],[ 2,-1, 0],[-1, 0, 0],[-1, 1, 0],[-1, 0, 0]],
[[ -1, 0, 0],[-1, 0,-1],[-1,-1, 0],[-1, 3,-1],[-1, 0,-1],[-1, 0,-1],[-1, 2, 0],[-1, 0, 0],[-1,-1, 0],[-1, 0, 0]],
[[ -1, 0, 0],[-1, 0, 0],[-1, 0,-1],[-1, 0,-1],[-1, 0,-1],[-1, 0,-1],[-1, 0,-1],[-1, 0,-1],[-1, 0, 0],[-1, 0, 0]],]

var onSprighTile =  Vector2(-2, 19)
var onTile = Vector2(2,8)
var winTile = Vector2(2,1)
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
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
