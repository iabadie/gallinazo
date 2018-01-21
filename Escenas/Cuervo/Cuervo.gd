extends RigidBody2D

var direccion = 1

var animacionActiva = false

const VELOCIDAD = 200


func _integrate_forces( state ):
	if abs(state.get_linear_velocity().x) < 0.2 :
		direccion = -direccion
		var animacionActiva = false
		if direccion > 0:
			get_node("AnimationPlayer").play("Derecha")
			animacionActiva = true
			pass
		else:
			get_node("AnimationPlayer").play("Izquierda")
			animacionActiva = true
			pass
		
		pass
	pass

func _ready():
	pass
	
func _physics_process(delta):
	
	#Animacion Movimiento
	if direccion > 0 && !animacionActiva:
		$AnimationPlayer.play("Derecha")
		animacionActiva = true
		pass
	elif direccion < 0 && !animacionActiva:
		$AnimationPlayer.play("Izquierda")
		animacionActiva = true
		pass
	
	
	var vectorVelocity = Vector2( (direccion * (VELOCIDAD*delta))/delta , 0 )
	set_linear_velocity(vectorVelocity)
	
	pass
