# llave_antigua.gd
# Llave antigua que activa un flashback cuando el jugador interactúa con ella
extends Area2D

# Exportar propiedades
@export var item_name: String = "Llave Antigua"

# Variables internas
var player_in_range: bool = false
var player_ref = null
var flashback_shown: bool = false

# Referencias a nodos
@onready var prompt_label: Label = $PromptLabel

func _ready():
	print("Llave antigua inicializada: ", name)
	# Conectar señales
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Ocultar el prompt inicialmente
	if prompt_label:
		prompt_label.hide()

func _process(_delta):
	# Verificar si el jugador presiona E mientras está en rango
	if player_in_range and Input.is_action_just_pressed("interact"):
		print("¡Interacción detectada con la llave!")
		interact()

func _on_body_entered(body):
	print("Algo entró en el área de la llave: ", body.name, " - Tipo: ", body.get_class())
	
	# Verificar si es un CharacterBody2D (el jugador) y está en el grupo "player"
	if body is CharacterBody2D and body.is_in_group("player"):
		print("¡Es el jugador! Mostrando prompt")
		player_in_range = true
		player_ref = body
		
		# Mostrar el prompt
		if prompt_label:
			prompt_label.show()
	else:
		print("No es el jugador, ignorando")

func _on_body_exited(body):
	print("Algo salió del área de la llave: ", body.name)
	
	if body is CharacterBody2D and body.is_in_group("player"):
		print("Jugador salió del rango de la llave")
		player_in_range = false
		player_ref = null
		
		# Ocultar el prompt
		if prompt_label:
			prompt_label.hide()

func interact():
	if flashback_shown:
		print("Ya se mostró el flashback de la llave")
		return
	
	print("Interactuando con la llave antigua...")
	
	# Marcar el flashback como mostrado
	flashback_shown = true
	
	# Aquí puedes agregar lógica adicional, como:
	# - Reproducir un sonido
	# - Mostrar un mensaje específico
	# - Activar un flashback único
	# - Agregar al inventario
	
	print("La llave antigua revela un recuerdo...")
	show_flashback()

func show_flashback():
	# Buscar el nodo de flashback en la escena
	var flashback_node = get_tree().get_first_node_in_group("flashback")
	
	if flashback_node and flashback_node.has_method("show_flashback"):
		print("Mostrando flashback desde la llave...")
		flashback_node.show_flashback()
	else:
		print("No se encontró el nodo de flashback en la escena")
		# Fallback: intentar cargar la escena de flashback
		var flashback_scene = load("res://flashback.tscn")
		if flashback_scene:
			var flashback_instance = flashback_scene.instantiate()
			get_tree().root.add_child(flashback_instance)
			if flashback_instance.has_method("show_flashback"):
				flashback_instance.show_flashback()
