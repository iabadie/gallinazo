extends Node2D

export (int) var CAMERA_JUMP
export (int) var NUMBER_OF_FLOORS
export (int) var TIME_TO_JUMP

var currentVisibleFloor = 3

func _ready():
	$Timer.wait_time = TIME_TO_JUMP
	$Timer.start()

func _on_Timer_timeout():
	$PuntoControlCamara.position.y -= CAMERA_JUMP
	currentVisibleFloor += 1
	if currentVisibleFloor < NUMBER_OF_FLOORS:
		$Timer.start()
	else:
		$Timer.stop()
		
