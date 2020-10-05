extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal nextLevel

var loss = false

var tileMap = [
[[ 3,-1,-1],[-1,11,-1],[-1,-1,-1]],
[[-1,-1,-1],[-1,12, 0],[-1,13, 0]],
[[-1,-1,-1],[-1, 0,-1],[-1,-1, 0]],
[[-1,-1, 0],[-1, 0, 0],[-1, 0, 0]],
[[-1,-1, 0],[-1, 0, 0],[-1,-1, 0]],
]

var onSprighTile =  Vector2(-18, 7)
var onTile = Vector2(0,2)
var winTile = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func unlock(id):
	print("open: ", id)
	if id == 11:$Node2D/mover/TileMap4.set_cell(-22, 4, 3)
	if id == 12:$Node2D/mover/TileMap3.set_cell(-26, 7, 3)
	if id == 13:$Node2D/mover/TileMap2.set_cell(-22, 10, 3)
	
	
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
