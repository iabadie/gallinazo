extends KinematicBody2D

const VELOCITY = 300
const GRAVITY = 20
const NORMAL_VECTOR = Vector2(0, -1)
const JUMP_FORCE = -700
const ACTIONS = {LEFT = "move_left", RIGHT = "move_right", JUMP = "jump"}

var motionVector = Vector2()
var direction = 1 # direction: 1 para derecha / -1 para izquierda

func _ready():
	$gallina_animacion.play()

func _physics_process(delta):
	shouldCameraMove()
	if !is_on_floor():
		motionVector.y += GRAVITY #set gravity vector
	checkButtonPressed() # Check buttons to set direction and jump
	checkAnimationDirection() # Set Animation direction
	checkWallDirection() # Test if player was on wall
	
	motionVector.x = VELOCITY * direction
	# Set new position by direction result
	move_and_slide(motionVector, NORMAL_VECTOR)
	
func checkButtonPressed():
	if is_on_floor():
		if Input.is_action_pressed(ACTIONS.LEFT):
			direction = -1
		elif Input.is_action_pressed(ACTIONS.RIGHT):
			direction = 1
		if Input.is_action_just_pressed(ACTIONS.JUMP):
			motionVector.y = JUMP_FORCE

func checkAnimationDirection():
	if direction == 1:
		$gallina_animacion.flip_h = false
	else:
		$gallina_animacion.flip_h = true

func checkWallDirection():
	if is_on_wall():
		direction = -direction	

func shouldCameraMove():
	print("ASD")