extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dragging = false
var lastPos = Vector2()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		dragging = true
		lastPos = event.position


func _input(event):
	if not dragging:return
	
	if event.is_action_released("click"):
		lastPos = Vector2()
		dragging = false
	
	if dragging and event is InputEventMouseMotion:
		position += (event.position - lastPos) * Vector2(1,0)
		
		lastPos = event.position
	


