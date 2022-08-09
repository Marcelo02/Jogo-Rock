extends Node2D

export var dano = 1
var icone = load("res://assets/Picaretas/picareta_resize.png")
onready var botao = $"../CanvasLayer/upgrade_Pick"
onready var jogo = get_node("..")
onready var icon = $"../CanvasLayer/upgrade_Pick/Ouro"
var upgrade_Price = 5
var gold_price = 2

func _ready():
	botao.text = "Melhorar Picareta: " + str(upgrade_Price) + "$ + " + str(gold_price)
	icon.position = Vector2(138 + botao.text.length(),12)

func _on_Button_pressed():
	if  jogo.Recursos.dinheiro < upgrade_Price:
		print("Você não tem dinheiro.")
		pass
	elif jogo.Recursos.ouro < gold_price:
		print("Você não tem ouro")
	else:
		jogo.Recursos.dinheiro -= upgrade_Price
		jogo.Recursos.ouro -= gold_price
		dano += 1
		print("Upgraded to:" + str(dano) )
		upgrade_Price += int(round(upgrade_Price*0.2))
		print(upgrade_Price)
		botao.text = "Melhorar Picareta: " + str(upgrade_Price) + "$ + " +str(gold_price)
		
		
		
