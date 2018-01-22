extends RigidBody2D


const SPEED = 100
const GRAVEDAD = 100

var animacionActiva = false
var direccion = 1
var cayendo = false

func _integrate_forces(state):
	
	if !$RayCastDerecha.is_colliding() :
		direccion = -1
		$AnimationPlayer.play("Izquierda")
		animacionActiva = true
	elif !$RayCastIzquierda.is_colliding() :
		direccion = 1
		$AnimationPlayer.play("Derecha")
		animacionActiva = true
	
	
	if abs(state.get_linear_velocity().x) < 0.2 :
		direccion = -direccion
		var animacionActiva = false
		if direccion > 0:
			$AnimationPlayer.play("Derecha")
			animacionActiva = true
		else:
			$AnimationPlayer.play("Izquierda")
			animacionActiva = true
	
	if state.get_linear_velocity().y < 0.2 :
		cayendo = false
	else:
		cayendo = true

func _ready():
	pass

func _physics_process(delta):
	
	var vectorVelocidad  = Vector2()
	
	#gravedad 
	vectorVelocidad.y = 0
	vectorVelocidad.x = 0
	
	#Animacion Movimiento
	if direccion > 0 && !animacionActiva:
		$AnimationPlayer.play("Derecha")
		animacionActiva = true
	elif direccion < 0 && !animacionActiva:
		$AnimationPlayer.play("Izquierda")
		animacionActiva = true
	if !cayendo :
	
		vectorVelocidad.x = (direccion * SPEED*delta)/delta
		
		
	set_linear_velocity(vectorVelocidad)


