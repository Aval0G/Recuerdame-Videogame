# clue.gd
# Script para objetos que son pistas coleccionables (ej. Veneno, Carta).
# Hereda de interactable.gd
extends "res://interactable.gd"

# El nombre del objeto tal como aparecerá en el inventario.
# Márcalo como @export para poder cambiarlo desde el editor de Godot.
@export var item_name: String = "Pista misteriosa"

# Exportar si este objeto desencadena un flashback
@export var triggers_flashback: bool = false

# Variable para controlar si ya se activó el flashback
var flashback_already_shown: bool = false

# Sobreescribimos la función interact() del padre
func interact():
	print("Interactuando con: ", item_name)
	
	# Si este objeto activa un flashback y no se ha mostrado aún
	if triggers_flashback and not flashback_already_shown:
		print("Activando flashback...")
		show_flashback()
		flashback_already_shown = true
		return
	
	print("Flashback ya mostrado o no configurado")
	
	# Código original para recolectar objetos (comentado)
	pass
	# Primero, comprobamos si el inventario NO está lleno
	# if not Inventory.is_full():
		# Añadimos este objeto al inventario global
		# Inventory.add_item(item_name)
		
		# Le decimos al jugador que ya no puede interactuar con esto
		# if player_in_range and player_in_range.current_interactable == self:
			# player_in_range.current_interactable = null
		
		# Emitimos la señal para ocultar el prompt de interacción
	# 	hide_interaction_prompt.emit()
		
		# El objeto desaparece
	# 	queue_free()
	# else:
		# Opcional: Mostrar un mensaje de "Inventario lleno"
		# print("El inventario está lleno.")
		# Podrías emitir una señal para que la UI muestre este mensaje

# Función para mostrar el flashback
func show_flashback():
	# Cargar la escena del flashback
	var flashback_scene = preload("res://flashback.tscn")
	var flashback_instance = flashback_scene.instantiate()
	
	# Añadirlo a la escena actual
	get_tree().root.add_child(flashback_instance)
	
	# Definir los textos del flashback - memoria fragmentada del personaje
	var flashback_texts: Array[String] = [
		"[center][wave amp=20 freq=2][color=#FFD700]El líquido carmesí...[/color][/wave][/center]",
		"[center][i]Un destello... imágenes borrosas...[/i][/center]",
		"[center][color=#8B0000]\"¿Quién... quién soy yo?\"[/color][/center]",
		"[center][shake rate=5 level=10]Recuerdo... un nombre... casi puedo escucharlo...[/shake][/center]",
		"[center][color=#CD853F]Una figura familiar... alguien importante...[/color][/center]",
		"[center][fade start=0 length=14][i]Pero todo se desvanece como arena entre los dedos...[/i][/fade][/center]",
		"[center][wave amp=30 freq=3][color=#4B0082]Esta pócima... ¿qué significa? ¿Por qué me resulta tan familiar?[/color][/wave][/center]",
		"[center][tornado radius=5 freq=2]Los fragmentos de mi pasado... siguen ocultos en la oscuridad.[/tornado][/center]"
	]
	
	# Iniciar el flashback
	flashback_instance.start_flashback(flashback_texts)
	
	# Conectar la señal de finalización para limpiar
	flashback_instance.flashback_finished.connect(_on_flashback_finished.bind(flashback_instance))

# Cuando el flashback termina
func _on_flashback_finished(flashback_instance):
	# Remover la instancia del flashback
	flashback_instance.queue_free()
	
	print("Flashback completado. El personaje reflexiona sobre sus recuerdos perdidos...")
