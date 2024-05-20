extends Node2D

var _PLAYER = 0
var _ENEMY = 1
var _TIE = -1

var player = null
var enemy = null
var env_mgr = null
var com_mgr = null
var combat_ui = null

var head = preload("res://src/coins/head.gd")
var normal_coin = preload("res://src/coins/normal_coin.gd")



# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Entities/Player")
	enemy = get_node("Entities/Enemy")
	
	env_mgr = get_node("EnvironmentManager")
	com_mgr = get_node("CombatManager")
	com_mgr.set_player(player)
	com_mgr.set_enemy(enemy)
	
	get_node("EnvironmentManager/EnemyLayer").add_child(enemy.duplicate())
	
	# Connect combat UI button
	
	combat_ui = $EnvironmentManager/CombatLayer/CombatUI
#	combat_ui.flip_button_pressed.connect(_on_flip_button_pressed)
	
	# 2 heads vs. normal coin
	
	player.add_coin(head.new())
	player.add_coin(head.new())
	player.add_coin(normal_coin.new())
	
	enemy.add_coin(normal_coin.new())
	
	handle_fight(enemy)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func handle_fight(enemy):
	combat_ui.add_player(player)
	combat_ui.add_enemy(enemy)
	combat_ui.visible = true
	var fight = com_mgr.fight()
	await combat_ui.flip_button_pressed
	var fight_result = com_mgr.fight()
	print(translate_combat(fight_result))
#	combat_ui.visible = false
	handle_fight(enemy)
	
func translate_combat(flip):
	var winner_value = flip[0]
	if winner_value == _PLAYER:
		return "You won, with %s heads versus their %s heads." % [flip[1], flip[2]]
	elif winner_value == _ENEMY:
		return "%s won, with %s heads versus your %s heads." % [enemy.get_enemy_name(), flip[2], flip[1]]
	else:
		return "It was a tie, with both getting %s heads." % flip[1]
		

func _on_flip_button_pressed():
	print("IT WORKS")
