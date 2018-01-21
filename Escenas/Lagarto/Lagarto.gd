extends RigidBody2D

var direccion = 1

const SPEED = 100

var animacionActiva = false


var vectorVelocidad  = Vector2()

const GRAVEDAD = 100

var callendo = false

func _integrate_forces(state):
	
	if !$RayCastDerecha.is_colliding() :
		direccion = -1
		$AnimationPlayer.play("Izquierda")
		animacionActiva = true
		pass
	elif !$RayCastIzquierda.is_colliding() :
		direccion = 1
		$AnimationPlayer.play("Derecha")
		animacionActiva = true
		pass
	
	
	if abs(state.get_linear_velocity().x) < 0.2 :
		direccion = -direccion
		var animacionActiva = false
		if direccion > 0:
			$AnimationPlayer.play("Derecha")
			animacionActiva = true
			pass
		else:
			$AnimationPlayer.play("Izquierda")
			animacionActiva = true
			pass
		
		pass
	
	if state.get_linear_velocity().y < 0.2 :
		callendo = false
		pass
	else:
		callendo = true
		pass
	pass

func _ready():
	pass

func _physics_process(delta):
	#gravedad 
	vectorVelocidad.y = 0
	vectorVelocidad.x = 0
	
	#Animacion Movimiento
	if direccion > 0 && !animacionActiva:
		$AnimationPlayer.play("Derecha")
		animacionActiva = true
		pass
	elif direccion < 0 && !animacionActiva:
		$AnimationPlayer.play("Izquierda")
		animacionActiva = true
		pass
	if !callendo :
	
		vectorVelocidad.x = (direccion * SPEED*delta)/delta
		
		pass
		
		set_linear_velocity(vectorVelocidad)
	pass


