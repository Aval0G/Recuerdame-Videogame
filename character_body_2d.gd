# player.gd
# Asigna este script a un nodo CharacterBody2D.
# NOTA: Este script es para movimiento en 4 direcciones (arriba/abajo/izquierda/derecha)
# SIN gravedad.
extends CharacterBody2D

# Define la velocidad de movimiento del jugador.
@export var SPEED: float = 150.0

# Límites de la pantalla (ajustar según tu ventana/nivel)
# Considera que el CollisionShape está a 128px hacia abajo + 48px de radio
@export var screen_bounds: Rect2 = Rect2(50, 50, 1058, 422)

# Variable para rastrear con qué objeto podemos interactuar
var current_interactable = null

# Obtenemos una referencia al nodo AnimatedSprite2D.
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	add_to_group("player")

func _physics_process(_delta: float) -> void:
	
	# 1. Obtener la dirección de entrada (4 DIRECCIONES)
	# Esto usa las acciones "move_left", "move_right", "move_up" y "move_down"
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# 2. Asignar velocidad
	# Usamos normalize() para que el movimiento diagonal no sea más rápido
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		# Frenado instantáneo. Puedes usar lerp para un frenado suave.
		velocity = Vector2.ZERO 
		# velocity = lerp(velocity, Vector2.ZERO, 0.1) # <-- Frenado suave opcional

	# 3. Mover al personaje
	move_and_slide()
	
	# 3.5. Aplicar límites de pantalla
	position.x = clamp(position.x, screen_bounds.position.x, screen_bounds.position.x + screen_bounds.size.x)
	position.y = clamp(position.y, screen_bounds.position.y, screen_bounds.position.y + screen_bounds.size.y)
	
	# 4. Actualizar animaciones
	update_animation(velocity)

# Esta función actualiza la animación y hacia dónde mira el sprite
func update_animation(current_velocity: Vector2) -> void:
	
	if current_velocity.length() > 0:
		# El personaje se está moviendo
		animated_sprite.play() # Continúa la animación que se esté reproduciendo
		
		# Lógica para 4 direcciones (arriba, abajo, lados)
		# Comprueba si el movimiento es más horizontal o vertical
		if abs(current_velocity.x) > abs(current_velocity.y):
			# Movimiento horizontal es dominante
			animated_sprite.animation = "walk" # Animación para la derecha
			animated_sprite.flip_h = current_velocity.x < 0 # Voltear para la izquierda
		else:
			# Movimiento vertical es dominante
			animated_sprite.flip_h = false # Quitar volteo
			if current_velocity.y < 0:
				animated_sprite.animation = "walk" # Animación para arriba
			else:
				animated_sprite.animation = "walk" # Animación para abajo
	else:
		# El personaje está quieto
		# Simple: solo pon "idle_down". Se puede hacer más complejo.
		# (Comprobamos para evitar que la animación se reinicie en bucle)
		if not animated_sprite.animation.begins_with("idle"):
			# TODO: Puedes hacer esta lógica más inteligente para que 
			# el 'idle' coincida con la última dirección.
			animated_sprite.animation = "idle"

# Función _input vacía (la interacción ahora la manejan los objetos directamente)
func _input(event):
	pass
