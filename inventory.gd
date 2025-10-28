# ui.gd
# Asigna este script a un nodo CanvasLayer en tu escena principal.
# Este CanvasLayer debe contener los nodos para mostrar el inventario (ej. un VBoxContainer con Labels o un ItemList)
extends CanvasLayer

# Asigna este nodo desde el editor.
# Podría ser un ItemList o un VBoxContainer.
@onready var inventory_display = $MarginContainer/InventoryList 

func _ready():
	pass	
	# Conectamos la señal del inventario a nuestra función de actualización
	# Inventory.inventory_updated.connect(_on_inventory_updated)
	# Mantenemos la UI del inventario oculta al inicio
	# inventory_display.get_parent().hide()
	
	# Ejemplo de cómo conectar los prompts de interacción
	# (Esto requiere que todos los 'interactable' emitan la señal)
	# get_tree().call_group("interactables", "show_interaction_prompt", _on_show_prompt)
	# get_tree().call_group("interactables", "hide_interaction_prompt", _on_hide_prompt)


func _input(event):
	pass
	# Comprobar si se presiona la tecla de inventario ('I' según tu GDD)
	# Configura "toggle_inventory" en el Mapa de Entrada
	# if event.is_action_just_pressed("toggle_inventory"):
	# 	var inv_container = inventory_display.get_parent()
	# 	inv_container.visible = not inv_container.visible

# Función que se llama cuando el inventario (Autoload) emite la señal
func _on_inventory_updated(new_items: Array):
	# Limpiamos la lista actual
	# inventory_display.clear()
	pass
	# Volvemos a llenar la lista con los nuevos objetos
	# for item in new_items:
	# 	inventory_display.add_item(item)

# --- Funciones (opcionales) para mostrar el prompt "Presiona E" ---
# @onready var interaction_prompt = $InteractionPrompt # Un nodo Label

# func _on_show_prompt(message):
# 	interaction_prompt.text = message
# 	interaction_prompt.show()

# func _on_hide_prompt():
# 	interaction_prompt.hide()
