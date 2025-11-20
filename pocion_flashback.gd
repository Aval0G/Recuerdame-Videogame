# pocion_flashback.gd
# Pócima que activa un flashback cuando el jugador interactúa con ella
extends Area2D

# Exportar propiedades
@export var item_name: String = "Pócima Misteriosa"

# Variables internas
var player_in_range: bool = false
var player_ref = null
var flashback_shown: bool = false

# Referencias a nodos
@onready var prompt_label: Label = $PromptLabel

func _ready():
	print("Pócima inicializada: ", name)
	# Conectar señales
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Ocultar el prompt inicialmente
	if prompt_label:
		prompt_label.hide()

func _process(_delta):
	# Verificar si el jugador presiona E mientras está en rango
	if player_in_range and Input.is_action_just_pressed("interact"):
		print("¡Interacción detectada con la pócima!")
		interact()

func _on_body_entered(body):
	print("Algo entró en el área de la pócima: ", body.name, " - Tipo: ", body.get_class())
	
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
	print("Algo salió del área de la pócima: ", body.name)
	
	if body is CharacterBody2D and body.is_in_group("player"):
		print("El jugador se fue")
		player_in_range = false
		player_ref = null
		
		# Ocultar el prompt
		if prompt_label:
			prompt_label.hide()

func interact():
	if flashback_shown:
		print("El flashback ya fue mostrado")
		return
	
	print("Iniciando flashback...")
	flashback_shown = true
	
	# Ocultar el prompt durante el flashback
	if prompt_label:
		prompt_label.hide()
	
	# Cargar y mostrar el flashback
	show_flashback()

func show_flashback():
	print("Cargando escena de flashback...")
	
	# Cargar la escena del flashback
	var flashback_scene = load("res://flashback_simple.tscn")
	if not flashback_scene:
		print("ERROR: No se pudo cargar la escena de flashback")
		return
	
	var flashback_instance = flashback_scene.instantiate()
	
	print("Añadiendo flashback a la escena...")
	get_tree().root.add_child(flashback_instance)
	
	# Definir los textos del flashback
	var flashback_texts: Array[String] = [
		"[center][wave amp=15 freq=3][color=#DC143C]El líquido carmesí...[/color][/wave][/center]",
		"[center][color=#C0C0C0][i]Un destello atraviesa mi mente...[/i][/color][/center]",
		"[center][shake rate=20 level=5][color=#8B0000]\"¿Quién... quién soy yo?\"[/color][/shake][/center]",
		"[center][color=#FFD700]Recuerdo... un nombre...[/color]\n[color=#B8860B]Casi puedo escucharlo...[/color][/center]",
		"[center][wave amp=10 freq=2][color=#CD853F]Una figura familiar...\nAlguien importante...[/color][/wave][/center]",
		"[center][color=#696969][i]Pero todo se desvanece\ncomo arena entre mis dedos...[/i][/color][/center]",
		"[center][color=#4B0082]Esta pócima...\n[wave amp=20 freq=4]¿Por qué me resulta tan familiar?[/wave][/color][/center]",
		"[center][shake rate=10 level=3][color=#2F4F4F]Los fragmentos de mi pasado...\nsiguen ocultos en la oscuridad.[/color][/shake][/center]"
	]
	
	print("Iniciando flashback con ", flashback_texts.size(), " textos...")
	flashback_instance.start_flashback(flashback_texts)
	
	# Conectar señal de finalización
	flashback_instance.flashback_finished.connect(_on_flashback_finished.bind(flashback_instance))

func _on_flashback_finished(flashback_instance):
	print("Flashback completado, limpiando...")
	flashback_instance.queue_free()
	
	# Marcar el flashback como visto en el estado global
	GameState.marcar_flashback_visto()
	
	# Si el jugador sigue en rango, mostrar el prompt de nuevo
	if player_in_range and prompt_label:
		prompt_label.text = "[E] Ya examinado"
		prompt_label.show()
