class_name Tester
extends Node

var PLAYER = 0
var ENEMY = 1
var TIE = -1

var coin = null
var flipper = null

# Called when the node enters the scene tree for the first time.
func _ready():
	coin = get_node('GeometricCoin')
	flipper = get_node('Flipper')
	var normcoin = get_node('NormalCoin')
	
	flipper.add_coin(coin)
	flipper.add_coin(normcoin)
	print(flipper.flip_coins())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
