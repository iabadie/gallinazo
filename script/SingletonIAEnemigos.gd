extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Speed = 200

var GRAVEDAD = 250

var distancia = Vector2()
var velocidad = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func MovimientoCuervo(delta,Direccion,trans = Transform2D()): # RETURN Vector3(posX,posY,Direccion)  Transform2D(0,get_global_position())
	#gravedad 
	velocidad.y += GRAVEDAD * delta
	
	#TestColicion
	
	#movimiento
	
	distancia.x = Speed*delta
	
	velocidad.x = (Direccion * distancia.x)/delta
	
	set_global_position(Vector2(trans.x,trans.y))
	
	if(!test_move(trans,Vector2((32*Direccion),1))):
		Direccion = -Direccion
		velocidad.x = (Direccion * distancia.x)/delta
		
		pass
	
	return Vector3(velocidad.x,velocidad.y,Direccion)
	
	pass
