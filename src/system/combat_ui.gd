class_name CombatUI

extends Node2D

var player = null
var enemy = null
var player_coin_list = null
var enemy_coin_list = null
var enemy_coin_label = null
signal flip_button_pressed

var head = preload("res://src/coins/head.gd")
var normal_coin = preload("res://src/coins/normal_coin.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	player_coin_list = get_node("PlayerCoinList")
	enemy_coin_list = get_node("EnemyCoinList")
	enemy_coin_label = get_node("EnemyCoinLabel")
	
#	player.add_coin(head.new())
#	player.add_coin(head.new())
#	player.add_coin(normal_coin.new())
#
#	add_player(player)
#
#	enemy = get_node("Enemy")
#
#	enemy.add_coin(normal_coin.new())
#
#	add_enemy(enemy)

func add_player(new_player):
	player = new_player
	player_coin_list.clear()
	for coin in player.coins:
		player_coin_list.add_item(coin.get_coin_name())

func add_enemy(new_enemy):
	enemy = new_enemy
	enemy_coin_list.clear()
	for coin in enemy.coins:
		enemy_coin_list.add_item(coin.get_coin_name(), null, false)
		
	enemy_coin_label.clear()
	enemy_coin_label.add_item(enemy.get_enemy_name() + "'s coins:")

func _on_flip_pressed():
	emit_signal("flip_button_pressed")
#
func get_player_coin_label(index):
	if index >= 0 and index < player_coin_list.get_item_count():
		return player_coin_list.get_item_text(index)
	else:
		return null
#
#func _on_player_coin_list_multi_selected(index, selected):
#	print($PlayerCoinList.get_selected_items().map(get_player_coin_label)
