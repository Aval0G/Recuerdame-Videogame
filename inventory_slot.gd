# inventory_slot.gd
# Slot individual del inventario
extends Panel

signal slot_clicked(item_data: Dictionary)

@onready var icon: TextureRect = $MarginContainer/VBoxContainer/Icon
@onready var quantity_label: Label = $MarginContainer/VBoxContainer/Quantity
@onready var button: Button = $Button

var item_data: Dictionary = {}

func _ready():
	button.pressed.connect(_on_button_pressed)
	clear_item()

func set_item(data: Dictionary):
	item_data = data
	
	if data["icon"]:
		icon.texture = data["icon"]
		icon.show()
	else:
		icon.hide()
	
	if data["quantity"] > 1:
		quantity_label.text = "x%d" % data["quantity"]
		quantity_label.show()
	else:
		quantity_label.hide()
	
	modulate = Color(1, 1, 1, 1)

func clear_item():
	item_data = {}
	icon.texture = null
	icon.hide()
	quantity_label.hide()
	modulate = Color(0.5, 0.5, 0.5, 0.5)

func _on_button_pressed():
	slot_clicked.emit(item_data)
