extends Node2D

export var durabilidade = 0
export var recursos =[ #array que armazena as informações dos recursos que irão dropar
	{"name":"carvao",
	"drop_chance": 100,
	"drop_range": 10
	},
	{"name":"ferro",
	"drop_chance": 50,
	"drop_range": 4
	
	},
	{"name": "ouro",
	"drop_chance": 10,
	"drop_range": 2
	}]

export var vida = 2
export var nivel = 1
onready var original_Pos = position
onready var shakeTimer = $shakeTimer
onready var tween = $Tween
var shake_amount = 0
signal quebrou

#Setta process como falso no começo para poder preparar o shafe
func _ready():
	pass

func _process(delta):
	#Shake da pedra
	position = Vector2(rand_range(-shake_amount, shake_amount), rand_range(-shake_amount, shake_amount)) * delta + original_Pos
	
	if vida <= 0:
		emit_signal("quebrou")

func shake(new_shake, shake_time=0.2, shake_limit=150):
	shake_amount += new_shake
	if shake_amount > shake_limit:
		shake_amount = shake_limit
	
	shakeTimer.wait_time = shake_time
	
	tween.stop_all()
	shakeTimer.start()

func _on_Timer_timeout():
	shake_amount = 0
	
	tween.interpolate_property(self, "position", position, original_Pos,
	0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
