# game_state.gd
# Singleton para manejar el estado global del juego
extends Node

# Variables de progreso
var flashback_pocion_visto: bool = false
var puertas_desbloqueadas: Dictionary = {
	"puerta_salon": false
}

# Función para marcar el flashback como visto
func marcar_flashback_visto():
	flashback_pocion_visto = true
	puertas_desbloqueadas["puerta_salon"] = true
	print("Flashback visto - Puerta del salón desbloqueada")

# Función para verificar si puede pasar por una puerta
func puede_usar_puerta(nombre_puerta: String) -> bool:
	return puertas_desbloqueadas.get(nombre_puerta, false)
