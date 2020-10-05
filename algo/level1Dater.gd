extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tileMap = [
[[ 0, 0, 0],[-1, 0, 0],[-1,-1, 0], [-1, 0, 0]],
[[-1, 0, 0],[-1, 0, 0],[-1,-1,-1], [-1, 0,-1]],
[[-1, 0, 0],[-1, 0, 0],[-1,-1, 0], [-1, 0, 0]],
[[-1, 0, 0],[-1, 0, 0],[-1, 0, 1], [-1, 0,-1]],
[[-1, 0, 0],[-1, 0, 0],[-1, 0, 0], [-1, 0, 0]]]

var onSprighTile =  Vector2(-18, 7)
var onTile = Vector2(3,2)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func unlock(id):
	if id == 1:$Node2D/mover/TileMap3.set_cell(-18, 7, 4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
