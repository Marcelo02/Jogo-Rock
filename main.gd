extends Node2D

			
onready var picareta = $Picareta #pega o node da picareta
onready var cena_pedra = preload("res://Pedras/Pedra.tscn")
onready var pedra = cena_pedra.instance()
onready var Level = $CanvasLayer/Level
onready var Barra = $CanvasLayer/TextureProgress
onready var Rec_Label = $CanvasLayer/Recursos_label


onready var Recursos = { #dicionario que armazena os valores dos recursos
	"dinheiro" : 0,
	"carvao" : 0,
	"ferro" : 0,
	"ouro" : 0
}

func _ready():
	randomize()
	Input.set_custom_mouse_cursor(picareta.icone) #coloca o icone da picareta no mouse
	spawn_pedra()
	
	Barra.max_value = pedra.vida
	Barra.value = pedra.vida
	

func _process(delta):
	Barra.value = pedra.vida
	Rec_Label.text = "Dinheiro: " + str(Recursos["dinheiro"]) + "\n" + "Carvão: " + str(Recursos["carvao"]) + "\n" + "Ferro: " + str(Recursos["ferro"]) + "\n" + "Ouro: " + str(Recursos["ouro"])

func spawn_pedra():
	pedra.position = Vector2(427,240) #coloca pedra na posição certa
	pedra.scale = Vector2(1.5,1.5) #Coloca pedra na escala certa
	pedra.connect("input_event",self,"_on_Pedra_input_event")
	pedra.connect("quebrou",self,"_on_Pedra_quebrou")
	
	add_child(pedra)

# Função que identifica o clique do mouse na pedra
func _on_Pedra_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_left"):
			#print("click") # Função de debug. APAGAR NA VERSÃO FINAL!
			
			pedra.shake(80,0.2,150)
			
			
			pedra.vida -= picareta.dano
			print("Vida:"+ str(pedra.vida))
			Barra.value = pedra.vida
			

func _on_Pedra_quebrou():
	
	var numero_randomico = randi() % 100 + 1
	print(numero_randomico)
	
	for recurso in pedra.recursos:
		if recurso["drop_chance"] > numero_randomico: #verifica se o numero randomico gerado é o suficiente pra dropar o recurso
			print(recurso["name"] + str(recurso["drop_chance"]))
			var drop = randi() % recurso["drop_range"] + 1
			print(drop)
			Recursos[recurso["name"]] += drop #adiciona o drop aos recursos
	
	pedra.nivel += 1
	pedra.vida = pedra.nivel
	Level.text = "Lvl. " + str(pedra.nivel)
	Barra.max_value = pedra.vida
	
	
	
		
	
	
	
