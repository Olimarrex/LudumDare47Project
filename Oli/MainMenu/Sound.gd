extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) > -40):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -36)

var soundOffTex = preload("res://Oli/MainMenu/musicOff.png");
var soundOnTex = preload("res://Oli/MainMenu/musicOn.png");

var hasSound = true;
var soundTex = [soundOffTex, soundOnTex];

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			hasSound = !hasSound;
			if(hasSound):
				print("a");
				AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -36)
			else:
				AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -10000)
			$".".texture = soundTex[int(hasSound)];
