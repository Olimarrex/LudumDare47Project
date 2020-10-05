extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playTime = 0.0
var vid = Node2D
var loop = Vector2(0,50)
var loopFrams = {0:[0,49], 1:[14,29], 2:[6,45], 3:[21, 40], 4:[39, 41], 5:[19, 36], 6:[24, 36], 7:[17, 40]}
var loopIn = 0
var loopOut = 0
var idn = 0
var looped = false
signal looped

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("playBar")
	vid = $AnimatedSprite
	vid.set_frame(0)


func solve():
	print("solve")
	$in.position[0] = int(loopFrams[idn][0]*28/5)+8
	$out.position[0] = int(loopFrams[idn][1]*28/5)+30

func loadVid(id=0):
	if id != -1:
		vid.queue_free()
		vid = load("res://Scene/camLoop/cams/cam"+str(id)+".tscn").instance()
		self.add_child(vid)
		vid.position  = Vector2(158,121)
		vid.set_frame(0)
		$AnimationPlayer.seek(0, true)
		$AnimationPlayer.play()
		vid.z_index = -1
		idn = id
		return true;
	else: 
		vid.z_index = -2
		$AnimationPlayer.seek(0, true)
		$AnimationPlayer.stop()
		return false;
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $AnimationPlayer.is_playing ( ):playTime = $AnimationPlayer.get_current_animation_position()
	else: playTime = 0
	if playTime >= ($out.position[0]-30)/28:
		loopIn = int((($in.position[0]-8)/28)*5)
		loopOut = int((($out.position[0]-30)/28)*5)
		print("loop ", loopIn, "  ", loopOut)
		print(loopFrams[idn])
		print(loopIn >= loopFrams[idn][0]-1 , loopIn <= loopFrams[idn][0]+1  , loopOut <= loopFrams[idn][1]+1 , loopOut >= loopFrams[idn][1]-1)
		if loopIn >= loopFrams[idn][0]-1 and loopIn <= loopFrams[idn][0]+1  and loopOut <= loopFrams[idn][1]+1 and loopOut >= loopFrams[idn][1]-1:
			looped = true
			print("it looped")
			emit_signal("looped")
		else:looped = false
		loop = Vector2(int((($in.position[0]-8)/28)*5), int((($out.position[0]-30)/28)*5))
		$AnimationPlayer.seek(($in.position[0]-8)/28, true)
		vid.set_frame(int((($in.position[0]-8)/28)*5))
		
		
	if $in.dragging and $in.position[0]+20 > $out.position[0]:
		$out.position = $in.position + Vector2(20, 0)

	if $out.dragging and $out.position[0]-20 < $in.position[0]:
		$in.position = $out.position - Vector2(20, 0)
