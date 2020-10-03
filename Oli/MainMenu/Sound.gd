extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var soundOffTex = preload("res://Oli/MainMenu/musicOff.png");
var soundOnTex = preload("res://Oli/MainMenu/musicOn.png");

var hasSound = true;
var soundTex = [soundOffTex, soundOnTex];

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			hasSound = !hasSound;
			$".".texture = soundTex[int(hasSound)];
