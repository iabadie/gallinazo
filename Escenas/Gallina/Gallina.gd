extends KinematicBody2D

const VELOCITY = 300
const GRAVITY = 20
const NORMAL_VECTOR = Vector2(0, -1)
const JUMP_FORCE = -700


var motionVector = Vector2()
var direction = 1 # direction: 1 para derecha / -1 para izquierda
var screenSize

func _ready():
	#Remover cuando se agreguen Botones para movimiento
	$gallina_animacion.play()
	screenSize = get_viewport_rect().size
	pass

func _physics_process(delta):
	motionVector.y += GRAVITY
	
	var velocityVector = Vector2()
	#Comportamiento de movimiento izquierda derecha automatico
	if position.x + 48 >= screenSize.x:
		direction = -1
	if position.x - 48 <= 0:
		direction = 1
	checkButtonPressed() # Check buttons to set direction and jump
	checkAnimationDirection() # Set Animation direction
	checkWallDirection() # Test if player was on wall
	
	motionVector.x = VELOCITY * direction
	
	move_and_slide(motionVector, NORMAL_VECTOR)
	
	# Set new position by direction result
	#linear_velocity = Vector2(VELOCITY * direction, linear_velocity.y)
	
func checkButtonPressed():
	if is_on_floor():
		if Input.is_action_pressed("move_left"):
			direction = -1
		elif Input.is_action_pressed("move_right"):
			direction = 1
		if Input.is_action_just_pressed("jump"):
			motionVector.y = JUMP_FORCE

func checkAnimationDirection():
	if direction == 1:
		$gallina_animacion.flip_h = false
	else:
		$gallina_animacion.flip_h = true

func checkWallDirection():
	if is_on_wall():
		direction = -direction	
