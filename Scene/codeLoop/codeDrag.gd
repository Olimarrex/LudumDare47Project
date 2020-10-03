extends Node2D



var dragging = false
var lastPos = Vector2()
export(String, "Start", "End", "middle") var blockType

var movable = true
var hitPre = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if blockType == "Start" or blockType == "End":
		movable = false
	self.get_parent().get_node("Timer").connect("timeout", self, "_on_Timer_timeout")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if movable:
		if event.is_action_pressed("click"):
			dragging = true
			lastPos = event.position
		if event.is_action_pressed("Rclick"):
				rotation += deg2rad(90)



func _input(event):
	if not dragging:return
	
	if event.is_action_released("click"):
		lastPos = Vector2()
		dragging = false
		position = Vector2(round(position[0]/64)*64, round(position[1]/64)*64)
	
	if dragging and event is InputEventMouseMotion:
		position += (event.position - lastPos)
		
		lastPos = event.position

func run():
	if hitPre:
		print("in loop")
	elif blockType == "End":
		print("no loop")
	else:
		hitPre = true
		var ray = $Area2D.get_node("RayCast2D")
		ray.enabled = true
		ray.force_raycast_update()
		if ray.is_colliding():
			ray.get_collider().get_parent().run()
		else:print("crash")



func _on_Timer_timeout():
	hitPre = false
	if blockType == "Start":
		hitPre = true
		var ray = $Area2D.get_node("RayCast2D")
		ray.enabled = true
		ray.force_raycast_update()
		if ray.is_colliding():
			ray.get_collider().get_parent().run()
		else:print("crash")
	pass # Replace with function body.
