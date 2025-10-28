extends Area2D

# Define la señal que este objeto emitirá cuando se haga clic en él.
# La escena principal (Level) escuchará esta señal.
signal interacted

# --- IMPORTANTE ---
# Para que las siguientes dos funciones funcionen, debes
# conectar las señales "mouse_entered" y "mouse_exited" del nodo Area2D.
#
# CÓMO HACERLO:
# 1. Selecciona el nodo "Interactable" (Area2D).
# 2. Ve al Inspector y haz clic en la pestaña "Nodo".
# 3. Haz doble clic en "mouse_entered" y conéctalo a este script (función _on_mouse_entered).
# 4. Haz doble clic en "mouse_exited" y conéctalo a este script (función _on_mouse_exited).


# Esta función se llama cuando el ratón entra en el área de colisión.
func _on_mouse_entered() -> void:
	# (OPCIONAL) Cambia el cursor cuando el ratón está encima.
	# print("Mouse entered") # Descomenta para probar
	
	# Descomenta la siguiente línea cuando tengas una imagen de cursor:
	# Input.set_custom_mouse_cursor(load("res://tu_cursor_interactivo.png"))
	pass # Borra 'pass' si descomentas la línea de arriba


# Esta función se llama cuando el ratón sale del área de colisión.
func _on_mouse_exited() -> void:
	# (OPCIONAL) Vuelve el cursor a la normalidad.
	# print("Mouse exited") # Descomenta para probar
	
	# Input.set_custom_mouse_cursor(null)
	pass # Borra 'pass' si descomentas la línea de arriba


# Esta función se llama automáticamente cuando ocurre un evento de input
# (como un clic) dentro del área de colisión de este Area2D.
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	
	# Comprobar si el evento es un clic del ratón
	if event is InputEventMouseButton:
		
		# Comprobar si fue el botón izquierdo (interact) Y si fue presionado (no soltado)
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			
			# ¡Es un clic! Emitir nuestra señal personalizada.
			# La escena del Nivel se encargará de qué hacer (ej. añadir al inventario).
			interacted.emit()
