extends Node2D


func _ready():
	pass 


func _on_Pedra_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		#print(event.as_text())
		if event.is_action_pressed("mouse_left"):
			print("click")
