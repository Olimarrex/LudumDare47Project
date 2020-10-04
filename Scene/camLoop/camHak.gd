extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playTime = 0.0
var vid = Node2D
var loop = Vector2(0,50)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("playBar")
	vid = $AnimatedSprite
	vid.set_frame(0)


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
	else: 
		vid.z_index = -2
		$AnimationPlayer.seek(0, true)
		$AnimationPlayer.stop()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playTime = $AnimationPlayer.get_current_animation_position()
	if playTime >= ($out.position[0]-30)/28:
		print("loop ", int((($in.position[0]-8)/28)*5), "  ",int((($out.position[0]-30)/28)*5))
		loop = Vector2(int((($in.position[0]-8)/28)*5), int((($out.position[0]-30)/28)*5))
		$AnimationPlayer.seek(($in.position[0]-8)/28, true)
		vid.set_frame(int((($in.position[0]-8)/28)*5))
		
		
	if $in.dragging and $in.position[0]+20 > $out.position[0]:
		$out.position = $in.position + Vector2(20, 0)

	if $out.dragging and $out.position[0]-20 < $in.position[0]:
		$in.position = $out.position - Vector2(20, 0)
