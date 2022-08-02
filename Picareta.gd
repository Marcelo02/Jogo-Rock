extends Node2D

export var picareta_Dano = 1
var picareta_Ferro = load("res://assets/Picaretas/picareta.png")

func _ready():
	Input.set_custom_mouse_cursor(picareta_Ferro)
