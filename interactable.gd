# interactable.gd
# Script base para CUALQUIER objeto con el que se pueda interactuar.
# Asigna este script a un nodo Area2D con un CollisionShape2D.
extends Area2D

# Variable para guardar la referencia al jugador cuando esté en rango
var player_in_range = null

# Señal para notificar a la UI que muestre un indicador (ej. "Presiona E")
signal show_interaction_prompt(message)
signal hide_interaction_prompt

func _ready():
	# Conectamos las señales de entrada y salida del área
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	# Comprobamos si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		print("Jugador entró en rango de: ", name)
		# Guardamos la referencia al jugador y le decimos que puede interactuar con nosotros
		player_in_range = body
		body.current_interactable = self
		# Emitimos una señal para que la UI muestre un mensaje
		show_interaction_prompt.emit("Examinar")

func _on_body_exited(body):
	if body.is_in_group("player"):
		print("Jugador salió del rango de: ", name)
		# Limpiamos las referencias cuando el jugador sale
		if body.current_interactable == self:
			body.current_interactable = null
			
		player_in_range = null
		# Escondemos el mensaje de la UI
		hide_interaction_prompt.emit()

# Esta es la función principal que será llamada por el jugador.
# Las clases que hereden de esta (como 'clue.gd') la sobreescribirán.
func interact():
	print("Interactuando con un objeto base. Deberías sobreescribir esta función.")
