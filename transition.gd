# transition.gd
# Sistema de transiciones entre escenas
extends CanvasLayer

signal transition_finished

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	layer = 100
	color_rect.color = Color(0, 0, 0, 0)

# Hacer fade out, cambiar escena, y fade in
func change_scene(target_scene: String):
	# Fade to black
	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", 1.0, 0.5)
	await tween.finished
	
	# Cambiar escena
	get_tree().change_scene_to_file(target_scene)
	
	# Esperar un frame para que la nueva escena cargue
	await get_tree().process_frame
	
	# Fade from black
	var tween_in = create_tween()
	tween_in.tween_property(color_rect, "color:a", 0.0, 0.5)
	await tween_in.finished
	
	transition_finished.emit()
