extends Node2D

export var dano = 1
var icone = load("res://assets/Picaretas/picareta.png")



func _on_Button_pressed():
	dano += 1
	print("Upgraded to:" + str(dano) )

	
