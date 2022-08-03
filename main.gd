extends Node2D

			
onready var picareta = $Picareta #pega o node da picareta
onready var pedra = $Pedra #pega o node da pedra
onready var Level = $CanvasLayer/Level
onready var Barra = $CanvasLayer/TextureProgress
onready var Recursos = $Recursos
onready var Rec_Label = $CanvasLayer/Recursos_label

func _ready():
	Input.set_custom_mouse_cursor(picareta.icone) #coloca o icone da picareta no mouse
	Barra.max_value = pedra.vida
	Barra.value = pedra.vida
	

func _process(delta):
	Barra.value = pedra.vida
	Rec_Label.text = "Dinheiro: " + str(Recursos.dinheiro) + "\n" + "Carvão: " + str(Recursos.carvao) + "\n" + "Ferro: " + str(Recursos.ferro) + "\n" + "Ouro: " + str(Recursos.ferro)

# Função que identifica o clique do mouse na pedra
func _on_Pedra_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_left"):
			print("click") # Função de debug. APAGAR NA VERSÃO FINAL!
			
			pedra.shake(80)
			
			if pedra.vida - picareta.dano > 0:
				pedra.vida -= picareta.dano
				print("Vida:"+ str(pedra.vida))
				Barra.value = pedra.vida
			else:
				print("Quebrada")
				pedra.nivel += 1
				pedra.vida = pedra.nivel
				Level.text = "Lvl. " + str(pedra.nivel)
				Barra.max_value = pedra.vida
