class_name Head

extends Coin


func flip():
	var heads = 1
	var tails = 0
	var output = {'name': get_name(), 'heads': heads, 'tails': tails}
	return output

func get_coin_name():
	return "Head"
