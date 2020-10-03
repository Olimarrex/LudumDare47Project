extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playTime = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("playBar")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playTime = $AnimationPlayer.get_current_animation_position()
	if playTime >= ($out.position[0]-32)/128:
		$AnimationPlayer.seek(($in.position[0]+32) / 128, true)
		print(($in.position[0]+32) / 128)
		$AnimatedSprite.set_frame((($in.position[0]+32) / 128)*5)
		
		
	if $in.dragging and $in.position[0]+64 > $out.position[0]:
		$out.position = $in.position + Vector2(64, 0)

	if $out.dragging and $out.position[0]-64 < $in.position[0]:
		$in.position = $out.position - Vector2(64, 0)
