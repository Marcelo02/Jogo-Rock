extends Node2D

export var durabilidade = 0
export var recursos =["carvao","ferro","ouro"]
export var vida = 2
export var picareta_Dano = 1




func _on_Quebrar():
	vida -= picareta_Dano
	print(vida)
	if vida == 0:
		print("Quebrada")
	else:
		pass


func _on_Button_pressed():
	picareta_Dano += 1
	print("Upgraded to:" + str(picareta_Dano) )
