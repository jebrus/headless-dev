extends Label

var ticks = null
var lines = null
var line_ct = null

# Called when the node enters the scene tree for the first time.
func _ready():
	ticks = 0
	line_ct = 0
	lines = ['Larry: hi hi hi haha', 'Larry: eminem is really cool', 'Larry: do you like him', 'Larry: im a rap god hahaha', 'Larry: anyways hows ur sex life']


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ticks += 1
	if ticks % 300 == 0 and line_ct < 5:
		text = lines[line_ct]
		line_ct += 1
