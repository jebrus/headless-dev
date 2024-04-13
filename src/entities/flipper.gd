class_name Flipper
extends Node

var coins = null

# Called when the node enters the scene tree for the first time.
func _ready():
	coins = []

func add_coin(coin):
	coins.append(coin)
	
func flip_coins():
	var heads = 0
	var tails = 0
	var flips = []
	
	for coin in coins:
		var flip = coin.flip()
		flips.append(flip)
		heads += flip['heads']
		tails += flip['tails']
		
	var output = {'heads': heads, 'tails': tails, 'flips': flips}
	return output
