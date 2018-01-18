extends Area2D

const DIRECITON_RIGHT = 'derecha'
const DIRECITON_LEFT = 'izquierda'
const VELOCITY_RIGHT = 10
const VELOCITY_LEFT = -10

var direction = DIRECITON_RIGHT
var screenSize

func _ready():
	#Remover cuando se agreguen Botones para movimiento
	$gallina_animacion.play()
	screenSize = get_viewport_rect().size
	pass

func _process(delta):
	#Remover cuando se agreguen Botones para movimiento
	if position.x > screenSize.x - VELOCITY_RIGHT:
		direction = DIRECITON_LEFT
	if position.x < 0 - 2 * VELOCITY_RIGHT:
		direction = DIRECITON_RIGHT
	if direction == DIRECITON_RIGHT:
		$gallina_animacion.flip_h = false
		position.x = position.x + VELOCITY_RIGHT
	else:
		$gallina_animacion.flip_h = true
		position.x = position.x + VELOCITY_LEFT
	