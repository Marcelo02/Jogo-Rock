extends Node2D

			
onready var picareta = $Picareta #pega o node da picareta
onready var cena_pedra = preload("res://Pedras/Pedra.tscn")
onready var pedra = cena_pedra.instance()
onready var Level = $CanvasLayer/Level
onready var Barra = $CanvasLayer/TextureProgress
onready var Rec_Label = $CanvasLayer/Recursos_label
onready var shop_Button = $CanvasLayer/upgrade_Shop
onready var coal_Button = $CanvasLayer/sell_Coal
onready var iron_Button = $CanvasLayer/sell_Iron
onready var gold_Button = $CanvasLayer/sell_Gold
onready var musica = $StreamMusica
var coal_Price = 1
var iron_Price = 5
var gold_Price = 10
var upgrade_Shop = 5

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
	
	musica.play()
	

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


func _on_sell_Coal():
	if Recursos.carvao > 0:
		Recursos.carvao -= 1
		Recursos.dinheiro += coal_Price
	else:
		print("Você não tem carvão!")
		pass # Replace with function body.


func _on_sell_Iron():
	if Recursos.ferro > 0:
		Recursos.ferro -= 1
		Recursos.dinheiro += iron_Price
	else:
		print("Você não tem Ferro!")
		pass # Replace with function body.


func _on_sell_Gold():
	if Recursos.ouro > 0:
		Recursos.ouro -= 1
		Recursos.dinheiro += gold_Price
	else:
		print("Você não tem Ouro!")
		pass # Replace with function body.


func _on_upgrade_Shop():
	if  Recursos.dinheiro < upgrade_Shop:
		print("Você não tem dinheiro.")
		pass
	else:
		Recursos.dinheiro -= upgrade_Shop
		coal_Price += int(round(coal_Price*0.2))
		iron_Price += int(round(iron_Price*0.3))
		gold_Price += int(round(gold_Price*0.4))
		upgrade_Shop += int(round(upgrade_Shop*0.2))
		coal_Button.text = "Vender Carvão: " + str(coal_Price) + "$"
		iron_Button.text = "Vender Ferro: " + str(iron_Price) + "$"
		gold_Button.text = "Vender Ouro: " + str(gold_Price) + "$"
		shop_Button.text = "Melhorar Loja: " + str(upgrade_Shop) + "$"

