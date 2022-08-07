extends Node2D

export var dano = 1
var icone = load("res://assets/Picaretas/picareta_resize.png")
onready var botao = $"../CanvasLayer/upgrade_Pick"
onready var jogo = get_node("..")
var upgrade_Price = 5

func _on_Button_pressed():
	if  jogo.Recursos.dinheiro < upgrade_Price:
		print("Você não tem dinheiro.")
		pass
	else:
		jogo.Recursos.dinheiro -= upgrade_Price
		dano += 1
		print("Upgraded to:" + str(dano) )
		upgrade_Price += int(round(upgrade_Price*0.2))
		print(upgrade_Price)
		botao.text = "Melhorar Picareta: " + str(upgrade_Price) + "$"
