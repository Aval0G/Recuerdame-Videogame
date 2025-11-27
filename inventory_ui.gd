# inventory_ui.gd
# UI del inventario que se muestra al presionar I
extends CanvasLayer

@onready var panel: Panel = $Panel
@onready var grid_container: GridContainer = $Panel/MarginContainer/VBoxContainer/GridContainer
@onready var item_description: RichTextLabel = $Panel/MarginContainer/VBoxContainer/ItemDescription
@onready var close_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/CloseButton

# Prefab del slot de inventario
const INVENTORY_SLOT = preload("res://inventory_slot.tscn")

var is_open: bool = false

func _ready():
	# Conectar señales
	inventory.inventory_updated.connect(_on_inventory_updated)
	close_button.pressed.connect(_close_inventory)
	
	# Ocultar al inicio
	hide()
	
	# Crear slots iniciales
	_create_slots()

func _process(_delta):
	if Input.is_action_just_pressed("inventory"):
		toggle_inventory()

func toggle_inventory():
	is_open = !is_open
	
	if is_open:
		show()
		get_tree().paused = true
		_update_inventory()
	else:
		hide()
		get_tree().paused = false

func _close_inventory():
	is_open = false
	hide()
	get_tree().paused = false

func _create_slots():
	# Limpiar slots existentes
	for child in grid_container.get_children():
		child.queue_free()
	
	# Crear slots vacíos
	for i in range(inventory.max_slots):
		var slot = INVENTORY_SLOT.instantiate()
		grid_container.add_child(slot)
		slot.slot_clicked.connect(_on_slot_clicked)

func _update_inventory():
	var items = inventory.get_items()
	var slots = grid_container.get_children()
	
	# Actualizar cada slot
	for i in range(slots.size()):
		if i < items.size():
			slots[i].set_item(items[i])
		else:
			slots[i].clear_item()

func _on_inventory_updated(_items: Array):
	if is_open:
		_update_inventory()

func _on_slot_clicked(item_data: Dictionary):
	if item_data.is_empty():
		item_description.text = "[center][color=#888888]Vacío[/color][/center]"
	else:
		item_description.text = "[center][b]%s[/b][/center]\n\n%s\n\n[color=#FFD700]Cantidad: %d[/color]" % [
			item_data["name"],
			item_data["description"],
			item_data["quantity"]
		]
