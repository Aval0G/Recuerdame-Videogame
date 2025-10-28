# player.gd
# Asigna este script a un nodo CharacterBody2D.
# NOTA: Este script es para un juego de VISTA DE LADO (side-view).
extends CharacterBody2D

# Define la velocidad de movimiento del jugador.
@export var SPEED: float = 150.0

# Variable para rastrear con qué objeto podemos interactuar
var current_interactable = null

# Obtenemos una referencia al nodo AnimatedSprite2D.
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	add_to_group("player")

func _physics_process(_delta: float) -> void:
	# 1. Obtener la dirección de entrada (SOLO HORIZONTAL)
	# Usamos get_axis para obtener un valor entre -1 (izquierda) y 1 (derecha)
	var horizontal_direction: float = Input.get_axis("move_left", "move_right")
	
	# 2. Asignar velocidad
	velocity.x = horizontal_direction * SPEED
	
	# --- NOTA SOBRE GRAVEDAD ---
	# Si tu juego es un PLATAFORMERO, necesitarás añadir gravedad aquí.
	# Ejemplo:
	# if not is_on_floor():
	# 	velocity.y += gravity * delta
	# Por ahora, asumimos que no hay gravedad (velocity.y = 0)
	
	# 3. Mover al personaje
	move_and_slide()
	
	# 4. Actualizar animaciones
	update_animation(velocity)

# Esta función actualiza la animación y hacia dónde mira el sprite
func update_animation(current_velocity: Vector2) -> void:
	
	if current_velocity.x != 0:
		# El personaje se está moviendo
		animated_sprite.play("walk") # Asegúrate de tener una animación llamada "walk"
		
		# Voltear el sprite basado en la dirección horizontal
		if current_velocity.x < 0:
			animated_sprite.flip_h = true # Mirando a la izquierda
		elif current_velocity.x > 0:
			animated_sprite.flip_h = false # Mirando a la derecha
	else:
		# El personaje está quieto
		animated_sprite.play("idle") # Asegúrate de tener una animación llamada "idle"

func _input(event):
	# Esta función se mantiene igual para las interacciones
	if event.is_action_just_pressed("interact") and current_interactable:
		current_interactable.interact()
