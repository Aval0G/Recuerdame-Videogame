# flashback.gd
# Sistema de cinemática para mostrar flashbacks con texto y efectos visuales
extends CanvasLayer

# Señal que se emite cuando el flashback termina
signal flashback_finished

# Referencias a los nodos de la UI
@onready var background: ColorRect = $Background
@onready var text_label: RichTextLabel = $TextContainer/TextLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Array de textos para el flashback
var flashback_texts: Array[String] = []
var current_text_index: int = 0
var is_playing: bool = false

func _ready():
	# Inicialmente oculto
	hide()
	print("Flashback scene ready")

# Inicia el flashback con los textos proporcionados
func start_flashback(texts: Array[String]):
	print("Iniciando flashback con ", texts.size(), " textos")
	flashback_texts = texts.duplicate()
	current_text_index = 0
	is_playing = true
	
	# Pausar el juego
	get_tree().paused = true
	print("Juego pausado")
	
	# Mostrar la cinemática
	show()
	
	# Efecto de pulsación en el fondo
	create_background_pulse()
	
	# Comenzar con el primer texto
	show_next_text()

# Crear efecto de pulsación en el fondo
func create_background_pulse():
	var tween = create_tween()
	tween.set_loops()
	tween.set_parallel(false)
	tween.tween_property(background, "modulate:a", 0.85, 3.0)
	tween.tween_property(background, "modulate:a", 1.0, 3.0)

# Muestra el siguiente texto del flashback
func show_next_text():
	if current_text_index < flashback_texts.size():
		print("Mostrando texto ", current_text_index + 1, " de ", flashback_texts.size())
		
		# Resetear y preparar el label
		text_label.modulate.a = 0.0
		text_label.visible_ratio = 0.0
		
		# Establecer el texto completo (para que BBCode funcione)
		var full_text = flashback_texts[current_text_index]
		text_label.text = full_text
		
		# Fade in del texto
		var tween_fade = create_tween()
		tween_fade.set_parallel(false)
		tween_fade.tween_property(text_label, "modulate:a", 1.0, 0.8)
		await tween_fade.finished
		
		# Efecto de aparición gradual del texto (revelar caracteres)
		var tween_reveal = create_tween()
		tween_reveal.tween_property(text_label, "visible_ratio", 1.0, 2.0)
		await tween_reveal.finished
		
		# Esperar un poco para que se lea
		await get_tree().create_timer(2.5, true, false, true).timeout
		
		# Fade out
		var tween_out = create_tween()
		tween_out.tween_property(text_label, "modulate:a", 0.0, 0.8)
		await tween_out.finished
		
		current_text_index += 1
		
		# Continuar con el siguiente texto
		show_next_text()
	else:
		# Terminar el flashback
		print("Finalizando flashback")
		end_flashback()

# Termina el flashback y devuelve el control al jugador
func end_flashback():
	is_playing = false
	hide()
	
	# Despausar el juego
	get_tree().paused = false
	print("Juego despausado")
	
	# Emitir señal de finalización
	flashback_finished.emit()

func _input(event):
	# Permitir saltar el flashback con ESC o E
	if is_playing and (event.is_action_pressed("ui_cancel") or event.is_action_pressed("interact")):
		print("Flashback saltado por el usuario")
		end_flashback()
