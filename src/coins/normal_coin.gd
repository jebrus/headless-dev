class_name NormalCoin
extends Coin


func flip():
	var heads = randi() % 2
	var tails = int(not heads)
	var output = {'name': get_name(), 'heads': heads, 'tails': tails}
	return output

func get_coin_name():
	return "Normal Coin"
