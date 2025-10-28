# inventory.gd
# Este script debe ser configurado como un "Autoload" (Singleton) en Godot.
# Ve a: Proyecto > Ajustes del Proyecto > Pestaña "Autoload"
# Añade este script con el nombre "Inventory"
extends Node

# Límite de objetos según tu GDD
const MAX_ITEMS = 5

# El array que guardará nuestras pistas (como strings)
var items: Array[String] = []

# Señal que se emite cada vez que el inventario cambia.
# La UI escuchará esta señal para actualizarse.
signal inventory_updated(new_items)

# Añadir un objeto al inventario
func add_item(item_name: String):
	if items.size() < MAX_ITEMS and not items.has(item_name):
		items.append(item_name)
		# Emitimos la señal con la nueva lista de objetos
		inventory_updated.emit(items)
		print("Inventario actualizado: ", items)
	elif items.has(item_name):
		print("Ya tienes este objeto.")
	else:
		print("Inventario lleno.")

# Comprobar si tenemos un objeto
func has_item(item_name: String) -> bool:
	return items.has(item_name)

# Comprobar si el inventario está lleno
func is_full() -> bool:
	return items.size() >= MAX_ITEMS

# Obtener todos los objetos (para la UI)
func get_items() -> Array[String]:
	return items
