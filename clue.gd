# clue.gd
# Script para objetos que son pistas coleccionables (ej. Veneno, Carta).
# Hereda de interactable.gd
extends "res://interactable.gd"

# El nombre del objeto tal como aparecerá en el inventario.
# Márcalo como @export para poder cambiarlo desde el editor de Godot.
@export var item_name: String = "Pista misteriosa"

# Sobreescribimos la función interact() del padre
func interact():
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
