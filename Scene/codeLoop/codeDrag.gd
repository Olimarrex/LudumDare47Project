extends Node2D


signal hacked
var dragging = false
var lastPos = Vector2()
var lastLoc = Vector2()

export(String, "middle", "Start", "End",  "noMove", "includ", "exclud", "solid") var blockType

var movable = true
var hitPre = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if blockType == "":blockType = "middle"
	if blockType == "Start" or blockType == "End":
		movable = false
	self.get_parent().get_node("Timer").connect("timeout", self, "_on_Timer_timeout")
	
	get_parent().tiles[int(position[1]-32)/64][int(position[0]-32)/64] = true
	lastLoc = position

	
	if blockType == "Start": 
		$icon.frame = 6
		$icon2.frame = 4
		
	if blockType == "End": 
		$icon.frame = 7
		$icon2.frame = 4
		$icon.rotation += deg2rad(-90)
		
	if blockType == "noMove":
		$icon.frame = 8
		$icon2.frame = 4
		movable = false
		
	if blockType == "includ":
		$icon.frame = 9
		$icon2.frame = 0
		get_parent().includTotle += 1

		movable = false
		
	if blockType == "exclud":
		$icon.frame = 10
		$icon2.frame = 0
		
		movable = false

	if blockType == "solid":
		$icon.frame = 5
		$icon2.frame = 0
		movable = false
		$Area2D.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	#print(blockType)
	if dragging:$Label.text = ""
	if movable:
		if event.is_action_pressed("click"):
			dragging = true
			z_index = 2
			lastPos = event.position
		if event.is_action_pressed("Rclick"):
				$icon.rotation += deg2rad(90)
				$Area2D/rotater.rotation += deg2rad(90)
				



func _input(event):
	if not dragging:return
	
	if event.is_action_released("click"):
		lastPos = Vector2()
		dragging = false
		z_index = 1
		var y = int(round((position[1]-32)/64))
		var x = int(round((position[0]-32)/64))
		if x < 5 and x >= 0 and y < 6 and y >= 0 and not get_parent().tiles[y][x]:
			position = Vector2(round((position[0]+32)/64)*64-32, round((position[1]+32)/64)*64-32)
			get_parent().tiles[int(position[1]-32)/64][int(position[0]-32)/64] = true
			get_parent().tiles[int(lastLoc[1]-32)/64][int(lastLoc[0]-32)/64] = false
			lastLoc = position
			
		else:position = lastLoc
	
	if dragging and event is InputEventMouseMotion:
		position += (event.position - lastPos)
		
		lastPos = event.position

func run():
	if blockType == "exclud":get_parent().hitEx = true
	
	if hitPre: return("looped")
	elif blockType == "End": return("end")
	else:
		if blockType == "includ":get_parent().includ -= 1
		hitPre = true
		var ray = $Area2D/rotater/RayCast2D
		ray.enabled = true
		ray.force_raycast_update()
		if ray.is_colliding():
			return(ray.get_collider().get_parent().run())
		else:return("crash")



func _on_Timer_timeout():
	hitPre = false
	if blockType == "Start":
		get_parent().inLoop = false
		get_parent().atEnd = false
		get_parent().crash = false
		get_parent().hitEx = false
		get_parent().hacked = false
		get_parent().includ = get_parent().includTotle
		
		hitPre = true
		var ray = $Area2D/rotater/RayCast2D
		ray.enabled = true
		ray.force_raycast_update()
		if ray.is_colliding():
			var result = ray.get_collider().get_parent().run()
			if result == "looped": get_parent().inLoop = true
			if result == "end": get_parent().atEnd = true
			if result == "crash": get_parent().crash = true
			#print (result)
		else:get_parent().crash = true
		ray.enabled = false
		
		if get_parent().inLoop:
			if not get_parent().hitEx and get_parent().includ == 0:
				get_parent().hacked = true
				emit_signal("hacked")




func _on_Area2D_mouse_entered():
	$Label.text  = blockType



func _on_Area2D_mouse_exited():
	$Label.text  = ""
