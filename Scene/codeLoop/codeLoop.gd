extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal hacked

var tiles = [
	[false,false,false,false,false],
	[false,false,false,false,false],
	[false,false,false,false,false],
	[false,false,false,false,false],
	[false,false,false,false,false],
	[false,false,false,false,false],
]

var inLoop = false
var atEnd = false
var crash = false

var hitEx = false
var includ = 0
var includTotle = 0

var hacked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$codeBlock.connect("hacked", self, "isHacked")
	
func isHacked():
	emit_signal("hacked")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
