extends KinematicBody2D

var Direccion = 1 # -1 = izquierda/ 1 = derecha
var Velocidad = 200

var GRAVEDAD = 250

var distancia = Vector2()
var velocidad = Vector2()

var animacionActiva = false

func _ready():
	set_physics_process(true)
	pass
	
func _physics_process(delta):
	
	#gravedad 
	velocidad.y += GRAVEDAD * delta
	
	#TestColicion
	
	#movimiento
	
	distancia.x = Velocidad*delta
	
	velocidad.x = (Direccion * distancia.x)/delta
	
	if(!test_move(Transform2D(0,get_global_position()),Vector2((32*Direccion),1))):
		Direccion = -Direccion
		velocidad.x = (Direccion * distancia.x)/delta
		animacionActiva = false
		
		#set_global_position(Vector2(get_global_position().x + (3 * Direccion) ,get_global_position().y))
		
		pass
	
	if Direccion > 0 && !animacionActiva:
		get_node("AnimationPlayer").play("Derecha")
		animacionActiva = true
		pass
	elif Direccion < 0 && !animacionActiva:
		get_node("AnimationPlayer").play("Izquierda")
		animacionActiva = true
		pass
	
	
	move_and_slide(velocidad,Vector2(0,-1))
	#set_linear_velocity(velocidad)
	
	pass
