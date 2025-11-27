# inventory.gd
# Sistema de inventario global (Autoload)
extends Node

# Señales
signal inventory_updated(items: Array)
signal item_added(item_name: String)
signal item_removed(item_name: String)

# Variables
var items: Array[Dictionary] = []
var max_slots: int = 12

# Estructura de un item:
# {
#   "name": String,
#   "description": String,
#   "icon": Texture2D,
#   "quantity": int
# }

func _ready():
	print("Sistema de inventario inicializado")

# Agregar un item al inventario
func add_item(item_name: String, description: String = "", icon: Texture2D = null, quantity: int = 1) -> bool:
	# Verificar si el item ya existe
	for item in items:
		if item["name"] == item_name:
			item["quantity"] += quantity
			print("Item actualizado: ", item_name, " x", item["quantity"])
			inventory_updated.emit(items)
			item_added.emit(item_name)
			return true
	
	# Verificar si hay espacio
	if items.size() >= max_slots:
		print("Inventario lleno!")
		return false
	
	# Agregar nuevo item
	var new_item = {
		"name": item_name,
		"description": description,
		"icon": icon,
		"quantity": quantity
	}
	items.append(new_item)
	print("Item agregado: ", item_name)
	inventory_updated.emit(items)
	item_added.emit(item_name)
	return true

# Remover un item del inventario
func remove_item(item_name: String, quantity: int = 1) -> bool:
	for i in range(items.size()):
		if items[i]["name"] == item_name:
			items[i]["quantity"] -= quantity
			if items[i]["quantity"] <= 0:
				items.remove_at(i)
			inventory_updated.emit(items)
			item_removed.emit(item_name)
			return true
	return false

# Verificar si tiene un item
func has_item(item_name: String) -> bool:
	for item in items:
		if item["name"] == item_name:
			return true
	return false

# Obtener cantidad de un item
func get_item_count(item_name: String) -> int:
	for item in items:
		if item["name"] == item_name:
			return item["quantity"]
	return 0

# Obtener todos los items
func get_items() -> Array[Dictionary]:
	return items

# Limpiar inventario
func clear():
	items.clear()
	inventory_updated.emit(items)

