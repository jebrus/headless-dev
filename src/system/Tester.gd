extends Node
var coin = null

# Called when the node enters the scene tree for the first time.
func _ready():
	coin = get_node('GeometricCoin')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(coin.flip())
