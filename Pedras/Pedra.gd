extends Node2D

export var durabilidade = 0
export var recursos =["carvao","ferro","ouro"]
export var vida = 2
export var nivel = 1
onready var original_Pos = position
onready var shakeTimer = $shakeTimer
onready var tween = $Tween
var shake_amount = 0

#Setta process como falso no começo para poder preparar o shafe
func _ready():
	set_process(false)

func _process(delta):
	#Shake da pedra
	position = Vector2(rand_range(-shake_amount, shake_amount), rand_range(-shake_amount, shake_amount)) * delta + original_Pos

func shake(new_shake, shake_time=0.2, shake_limit=150):
	shake_amount += new_shake
	if shake_amount > shake_limit:
		shake_amount = shake_limit
	
	shakeTimer.wait_time = shake_time
	
	tween.stop_all()
	set_process(true)
	shakeTimer.start()

func _on_Timer_timeout():
	shake_amount = 0
	set_process(false)
	
	tween.interpolate_property(self, "position", position, original_Pos,
	0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
