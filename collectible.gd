# collectible.gd
# Objeto coleccionable genérico
extends Area2D

@export var item_name: String = "Item Misterioso"
@export var item_description: String = "Un objeto que podría ser importante..."
@export var item_icon: Texture2D = null
@export var auto_collect: bool = false # Si true, se recoge al tocarlo

var player_in_range: bool = false
var player_ref = null
var already_collected: bool = false

@onready var prompt_label: Label = $PromptLabel
@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	print("Coleccionable inicializado: ", item_name)
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	if prompt_label:
		prompt_label.hide()

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact") and not auto_collect:
		collect()

func _on_body_entered(body):
	if body is CharacterBody2D and body.is_in_group("player"):
		player_in_range = true
		player_ref = body
		
		if auto_collect:
			collect()
		elif prompt_label and not already_collected:
			prompt_label.show()

func _on_body_exited(body):
	if body is CharacterBody2D and body.is_in_group("player"):
		player_in_range = false
		player_ref = null
		
		if prompt_label:
			prompt_label.hide()

func collect():
	if already_collected:
		return
	
	# Obtener el icono del sprite si no se especificó uno
	var icon = item_icon
	if icon == null and sprite:
		icon = sprite.texture
	
	# Agregar al inventario
	var success = inventory.add_item(item_name, item_description, icon, 1)
	
	if success:
		print("Item recogido: ", item_name)
		already_collected = true
		
		# Efecto visual de recolección
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(self, "scale", Vector2(0, 0), 0.3)
		tween.tween_property(self, "modulate:a", 0.0, 0.3)
		await tween.finished
		
		queue_free()
	else:
		print("Inventario lleno!")
		if prompt_label:
			prompt_label.text = "Inventario lleno!"
			await get_tree().create_timer(2.0).timeout
			prompt_label.text = "[E] Recoger"
