extends Node2D

export var durabilidade = 0
export var recursos =["carvao","ferro","ouro"]
export var vida = 2
export var picareta_Dano = 1
var picareta_Ferro = load("res://assets/Picaretas/picareta.png")

func _ready():
	Input.set_custom_mouse_cursor(picareta_Ferro)

func _on_Quebrar():
	vida -= picareta_Dano
	print(vida)
	if vida == 0:
		print("Quebrada")
	else:
		pass
