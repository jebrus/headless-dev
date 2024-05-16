class_name GeometricCoin
extends Coin


func flip():
	var heads = 0
	var tails = 1
	
	while randi() % 2 == 0:
		heads += 1
	var output = {'name': get_name(), 'heads': heads, 'tails': tails}
	return output
	
func get_coin_name():
	return "Normal Coin"
