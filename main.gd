extends Node2D

var picareta_Ferro = load("res://assets/Picaretas/picareta.png")

signal Quebrar

func _ready():
	Input.set_custom_mouse_cursor(picareta_Ferro)

# Função que identifica o clique do mouse
func _on_Pedra_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_left"):
			emit_signal("Quebrar")
			print("click") # Função de debug. APAGAR NA VERSÃO FINAL!
