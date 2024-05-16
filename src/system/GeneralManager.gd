extends Node2D

var _PLAYER = 0
var _ENEMY = 1
var _TIE = -1

var player = null
var enemy = null
var env_mgr = null
var com_mgr = null

var head = preload("res://src/coins/head.gd")
var normal_coin = preload("res://src/coins/normal_coin.gd")
var combat_ui = preload("res://src/system/combat_ui.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Entities/Player")
	enemy = get_node("Entities/Enemy")
	
	env_mgr = get_node("EnvironmentManager")
	com_mgr = get_node("CombatManager")
	com_mgr.set_player(player)
	com_mgr.set_enemy(enemy)
	
	get_node("EnvironmentManager/EnemyLayer").add_child(enemy.duplicate())
	
	# 2 heads vs. normal coin
	
	player.add_coin(head.new())
	player.add_coin(head.new())
	
	enemy.add_coin(normal_coin.new())
	
	handle_fight(enemy)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func handle_fight(enemy):
	combat_ui = env_mgr.get_node("CombatLayer").get_node("CombatUI")
	combat_ui.add_player(player)
	combat_ui.add_enemy(enemy)
	var fight = com_mgr.fight()
	
