extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var Direccion = 1 # -1 = izquierda/ 1 = derecha
var Velocidad = 200

var distancia = Vector2()
var velocidad = Vector2()

var animacionActiva = false

var cont =0



func _ready():
	set_physics_process(true)
	pass
	
func _physics_process(delta):
	
	if cont > 20:
		Direccion = -Direccion
		cont =0
		animacionActiva = false
		pass
	else:
		cont +=1
		pass
	
	if Direccion > 0 && !animacionActiva:
		get_node("AnimationPlayer").play("Derecha")
		animacionActiva = true
		pass
	elif Direccion < 0 && !animacionActiva:
		get_node("AnimationPlayer").play("Izquierda")
		animacionActiva = true
		pass
		
	distancia.x = Velocidad*delta
	
	velocidad.x = (Direccion * distancia.x)/delta
	
	move_and_slide(velocidad,Vector2(0,-1))
	
	pass
