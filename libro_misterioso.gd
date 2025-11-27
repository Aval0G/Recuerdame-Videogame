# libro_misterioso.gd
# Libro interactuable que da pistas sobre la historia
extends Area2D

# Variables internas
var player_in_range: bool = false
var player_ref = null
var ya_leido: bool = false

# Referencias a nodos
@onready var prompt_label: Label = $PromptLabel

func _ready():
	print("Libro inicializado: ", name)
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
		print("Jugador cerca del libro")
		player_in_range = true
		player_ref = body
		
		# Mostrar el prompt
		if prompt_label:
			if ya_leido:
				prompt_label.text = "[E] Leer de nuevo"
			else:
				prompt_label.text = "[E] Examinar libro"
			prompt_label.show()

func _on_body_exited(body):
	if body is CharacterBody2D and body.is_in_group("player"):
		print("Jugador se alejó del libro")
		player_in_range = false
		player_ref = null
		
		# Ocultar el prompt
		if prompt_label:
			prompt_label.hide()

func interact():
	print("Examinando libro misterioso...")
	ya_leido = true
	
	# Ocultar el prompt durante la lectura
	if prompt_label:
		prompt_label.hide()
	
	# Mostrar el texto del libro
	mostrar_texto_libro()

func mostrar_texto_libro():
	print("Mostrando texto del libro...")
	
	# Cargar la escena de diálogo/texto
	var flashback_scene = load("res://flashback_simple.tscn")
	if not flashback_scene:
		print("ERROR: No se pudo cargar la escena de texto")
		return
	
	var flashback_instance = flashback_scene.instantiate()
	get_tree().root.add_child(flashback_instance)
	
	# Textos del libro
	var libro_textos: Array[String] = [
		"[center][color=#8B4513][i]\"Diario de Investigación - Dr. E. Recuérdame\"[/i][/color][/center]",
		"[center][color=#A0522D]Día 47: Los experimentos con la memoria continúan...[/color][/center]",
		"[center][color=#CD853F]He descubierto que ciertos objetos pueden\ndesencadenar recuerdos perdidos.[/color][/center]",
		"[center][shake rate=5 level=3][color=#8B0000]La pócima roja... ¿por qué me resulta tan familiar?[/color][/shake][/center]",
		"[center][color=#696969][i]Algunas páginas están arrancadas...\nAlguien no quiere que recuerdes.[/i][/color][/center]"
	]
	
	flashback_instance.start_flashback(libro_textos)
	flashback_instance.flashback_finished.connect(_on_texto_finished.bind(flashback_instance))

func _on_texto_finished(flashback_instance):
	print("Lectura del libro completada")
	flashback_instance.queue_free()
	
	# Si el jugador sigue en rango, mostrar el prompt de nuevo
	if player_in_range and prompt_label:
		prompt_label.text = "[E] Leer de nuevo"
		prompt_label.show()
