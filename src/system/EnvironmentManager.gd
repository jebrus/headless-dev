class_name EnvironmentManager
extends Node2D

var player = null
var enemy = null

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	enemy = get_node('Enemy')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
