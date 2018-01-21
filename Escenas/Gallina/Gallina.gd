extends Area2D

const VELOCITY = 10

var direction = 1 # direction: 1 para derecha / -1 para izquierda
var screenSize

func _ready():
	#Remover cuando se agreguen Botones para movimiento
	$gallina_animacion.play()
	screenSize = get_viewport_rect().size
	pass

func _process(delta):
	#Comportamiento de movimiento izquierda derecha automatico
	if position.x + 48 >= screenSize.x:
		direction = -1
	if position.x - 48 <= 0:
		direction = 1

	# Set Animation direction
	if direction == 1:
		$gallina_animacion.flip_h = false
	else:
		$gallina_animacion.flip_h = true
	# Set new position by direction result
	position.x = position.x + (VELOCITY * direction)
	