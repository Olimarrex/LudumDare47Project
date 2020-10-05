extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var onSprighTile = Vector2(-18, 7)
var locked = []


var loss = false
var sUp = Vector2(-322, 254)
var sRight = Vector2(-322, 448)
var sDown = Vector2(-578, 445)
var sLeft = Vector2(-579, 254)
var sMiddle = Vector2(-450, 352)
var levelOffSet = Vector2()
var tileMap = ['no']
var unlocked = [0]
var loopedCams = [-1]
var codeNodes = {}
var codeID = 0
var onTile = Vector2(3,2)
var winTile = Vector2()



# Called when the node enters the scene tree for the first time.
func _ready():
	onSprighTile = get_parent().onSprighTile
	onTile = get_parent().onTile
	tileMap = get_parent().tileMap
	winTile = get_parent().winTile
	get_parent().get_node("UI").get_node("camLoop").connect("looped", self, "vidLoop")
	
func swopCode(id=0):
	if id == 0:
		if codeID != 0:get_parent().get_node("UI").remove_child(codeNodes[codeID])
		codeID = 0
	else:
		if id == codeID:return
		if not codeNodes.has(id):
			#print("not has id")
			if codeID != 0:
				print(codeID)
				get_parent().get_node("UI").remove_child(codeNodes[codeID])
			codeNodes[id] = load("res://Scene/codeLoop/code/codeLoop"+str(id)+".tscn").instance()
			get_parent().get_node("UI").add_child(codeNodes[id])
			get_parent().get_node("UI/codeLoop").position = Vector2(12,328)
			
			codeNodes[id].connect("hacked", self, "isHacked")
		else:
			if codeID != 0:get_parent().get_node("UI").remove_child(codeNodes[codeID])
			get_parent().get_node("UI").add_child(codeNodes[id])
		codeID = id
		
func isHacked():
	if not unlocked.has(codeID):
		print("you hacked: ", codeID)
		unlocked.append(codeID)
		get_parent().unlock(codeID)
		
func win():
	if not loss:get_parent().win()
	
func loos():
	pass
	#loss = true
	#get_parent().get_node("AudioStreamPlayer/alarm").play()
	#get_parent().get_node("AudioStreamPlayer/AnimationPlayer").play("New Anim")
	
	
	
	

func vidLoop():
	loopedCams.append(get_parent().get_node("UI/camLoop").idn)
	get_parent().get_node("UI").get_node("unsolved").z_index = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		print("middle: ", onTile)
		if onTile == winTile:win()
	if event.is_action_pressed("Rclick"):
		#get_parent().get_node("UI").get_node("camLoop").loadVid()
		$slector.position = sMiddle
		var sTile = tileMap [onTile[0]] [onTile[1]]
		get_parent().get_node("UI").get_node("camLoop").loadVid(sTile[0])
		if sTile[0] > -1 and loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("camLoop").solve()
		if loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("unsolved").z_index = 0
		else: get_parent().get_node("UI").get_node("unsolved").z_index = 1
		if sTile[1] <= 0 and sTile[2] <= 0:swopCode(0)
		if sTile[1] > 0 :swopCode(sTile[1])
		if sTile[2] > 0 :swopCode(sTile[2])
		
		


#up
func _on_Area2D2_input_event_up(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		#print("up",onTile, tileMap [onTile[0]] [onTile[1]])
		if $mover/flore.get_cell(onSprighTile[0]+4, onSprighTile[1]-3) >= 0: 
			#if tileMap [onTile[0]] [onTile[1]][2] != -1:
			if unlocked.has(tileMap [onTile[0]] [onTile[1]][2]):
				$mover.position += Vector2(-128, 96)
				$slector.position += Vector2(-128, 96)
				onTile += Vector2(-1,0)
				onSprighTile += Vector2(4, -3)
				if not loopedCams.has(tileMap [onTile[0]] [onTile[1]][0]):
					if get_parent().get_node("UI/camLoop").looped:loopedCams.append(get_parent().get_node("UI/camLoop").idn)
					else: loos()
				if onTile == winTile:win()
				
	if event.is_action_pressed("Rclick"):
		$slector.position = sUp
		var sTile = tileMap [onTile[0]-1] [onTile[1]]
		print(loopedCams, sTile)
		get_parent().get_node("UI").get_node("camLoop").loadVid(sTile[0])
		if sTile[0] > -1 and loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("camLoop").solve()
		if loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("unsolved").z_index = 0
		else: get_parent().get_node("UI").get_node("unsolved").z_index = 1
		if sTile[1] <= 0 and sTile[2] <= 0:swopCode(0)
		if sTile[1] > 0 :swopCode(sTile[1])
		if sTile[2] > 0 :swopCode(sTile[2])
		
#right
func _on_Area2D3_input_event_left(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		#print("right",onTile,  tileMap [onTile[0]] [onTile[1]])
		if $mover/flore.get_cell(onSprighTile[0]+4, onSprighTile[1]+3) >= 0 :
			#if tileMap [onTile[0]] [onTile[1]+1][1] != -1:
			if unlocked.has(tileMap [onTile[0]] [onTile[1]+1][1]):
				$mover.position += Vector2(-128, -96)
				$slector.position += Vector2(-128, -96)
				onTile += Vector2(0,1)
				onSprighTile += Vector2(4, 3)
				if not loopedCams.has(tileMap [onTile[0]] [onTile[1]][0]):
					if get_parent().get_node("UI/camLoop").looped:loopedCams.append(get_parent().get_node("UI/camLoop").idn)
					else: loos()
				if onTile == winTile:win()
				
	if event.is_action_pressed("Rclick"):
		$slector.position = sRight
		var sTile = tileMap [onTile[0]] [onTile[1]+1]
		get_parent().get_node("UI").get_node("camLoop").loadVid(sTile[0])
		if sTile[0] > -1 and loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("camLoop").solve()
		if loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("unsolved").z_index = 0
		else: get_parent().get_node("UI").get_node("unsolved").z_index = 1
		if sTile[1] <= 0 and sTile[2] <= 0:swopCode(0)		
		if sTile[1] > 0 :swopCode(sTile[1])
		if sTile[2] > 0 :swopCode(sTile[2])
#down
func _on_Area2D4_input_event_down(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		print("down",onTile,  tileMap [onTile[0]] [onTile[1]])
		if $mover/flore.get_cell(onSprighTile[0]-4, onSprighTile[1]+3) >= 0:
			#if tileMap [onTile[0]+1] [onTile[1]][2] != -1:
			if unlocked.has(tileMap [onTile[0]+1] [onTile[1]][2]):
				$mover.position += Vector2(128, -96)
				$slector.position += Vector2(128, -96)
				onTile += Vector2(1,0)
				onSprighTile += Vector2(-4, 3)
				if not loopedCams.has(tileMap [onTile[0]] [onTile[1]][0]):
					if get_parent().get_node("UI/camLoop").looped:loopedCams.append(get_parent().get_node("UI/camLoop").idn)
					else: loos()
				if onTile == winTile:win()
	if event.is_action_pressed("Rclick"):
		$slector.position = sDown
		var sTile = tileMap [onTile[0]+1] [onTile[1]]
		get_parent().get_node("UI").get_node("camLoop").loadVid(sTile[0])
		if sTile[0] > -1 and loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("camLoop").solve()
		if sTile[1] <= 0 and sTile[2] <= 0:swopCode(0)		
		if sTile[1] > 0 :swopCode(sTile[1])
		if sTile[2] > 0 :swopCode(sTile[2])
#left
func _on_Area2D5_input_event_right(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		#print("left",onTile, tileMap [onTile[0]] [onTile[1]])
		if $mover/flore.get_cell(onSprighTile[0]-4, onSprighTile[1]-3) >= 0:
			if tileMap [onTile[0]] [onTile[1]][1] != -1:
				if unlocked.has(tileMap [onTile[0]] [onTile[1]][1]):
					$mover.position += Vector2(128, 96)
					$slector.position += Vector2(128, 96)
					onTile += Vector2(0,-1)
					onSprighTile += Vector2(-4, -3)
				if not loopedCams.has(tileMap [onTile[0]] [onTile[1]][0]):
					if get_parent().get_node("UI/camLoop").looped:loopedCams.append(get_parent().get_node("UI/camLoop").idn)
					else: loos()
				if onTile == winTile:win()
	if event.is_action_pressed("Rclick"):
		$slector.position = sLeft
		var sTile = tileMap [onTile[0]] [onTile[1]-1]
		get_parent().get_node("UI").get_node("camLoop").loadVid(sTile[0])
		if sTile[0] > -1 and loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("camLoop").solve()
		if loopedCams.has(sTile[0]):get_parent().get_node("UI").get_node("unsolved").z_index = 0
		else: get_parent().get_node("UI").get_node("unsolved").z_index = 1
		if sTile[1] <= 0 and sTile[2] <= 0:swopCode(0)
		if sTile[1] > 0 :swopCode(sTile[1])
		if sTile[2] > 0 :swopCode(sTile[2])
