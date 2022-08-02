extends Node2D





func _ready():
	var picareta = $Picareta #pega o node da picareta
	Input.set_custom_mouse_cursor(picareta.icone) #coloca o icone da picareta no mouse

# Função que identifica o clique do mouse na pedra
func _on_Pedra_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_left"):
			print("click") # Função de debug. APAGAR NA VERSÃO FINAL!
			
			var picareta = $Picareta #pega o node da picareta
			var pedra = $Pedra #pega o node da pedra
			
			if pedra.vida - picareta.dano > 0:
				pedra.vida -= picareta.dano
				print(pedra.vida)
			else:
				print("Quebrada")
				pedra.nivel += 1
				pedra.vida = pedra.nivel
			
