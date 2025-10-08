extends Node2D
@onready var splash = $SplashScreen
@onready var ui = $UI

func _ready():
    # Show splash then go to level1
    print("Hero Quest - ready")
