# puerta.gd
# Script para puertas que transportan entre escenas
extends Area2D

# Exportar propiedades
@export var escena_destino: String = "res://salon_principal.tscn"
@export var requiere_flashback: bool = true
@export var nombre_puerta: String = "puerta_salon"

# Variables internas
var player_in_range: bool = false
var player_ref = null

# Referencias a nodos
@onready var prompt_label: Label = $PromptLabel

func _ready():
	print("Puerta inicializada: ", name)
	# Conectar señales
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Ocultar el prompt inicialmente
	if prompt_label:
		prompt_label.hide()

func _process(_delta):
	# Verificar si el jugador presiona E mientras está en rango
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()

func _on_body_entered(body):
	if body is CharacterBody2D and body.is_in_group("player"):
		print("Jugador cerca de la puerta")
		player_in_range = true
		player_ref = body
		
		# Mostrar el prompt apropiado
		if prompt_label:
			if puede_abrir():
				prompt_label.text = "[E] Ir al Salón"
				prompt_label.modulate = Color(0, 1, 0) # Verde
			else:
				prompt_label.text = "Aún te falta algo de ti..."
				prompt_label.modulate = Color(1, 0, 0) # Rojo
			prompt_label.show()

func _on_body_exited(body):
	if body is CharacterBody2D and body.is_in_group("player"):
		print("Jugador se alejó de la puerta")
		player_in_range = false
		player_ref = null
		
		# Ocultar el prompt
		if prompt_label:
			prompt_label.hide()

func puede_abrir() -> bool:
	if not requiere_flashback:
		return true
	return GameState.puede_usar_puerta(nombre_puerta)

func interact():
	if puede_abrir():
		print("Cambiando a escena: ", escena_destino)
		cambiar_escena()
	else:
		print("Puerta bloqueada - Necesitas examinar la pócima primero")
		mostrar_mensaje_bloqueado()

func cambiar_escena():
	# Usar el sistema de transición
	SceneTransition.change_scene(escena_destino)

func mostrar_mensaje_bloqueado():
	# Hacer que el texto parpadee
	if prompt_label:
		var tween = create_tween()
		tween.set_loops(3)
		tween.tween_property(prompt_label, "modulate:a", 0.3, 0.2)
		tween.tween_property(prompt_label, "modulate:a", 1.0, 0.2)
