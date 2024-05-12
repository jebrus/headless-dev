class_name CombatManager
extends Node

var PLAYER = 0
var ENEMY = 1
var TIE = -1
var player = null
var enemy = null

func _ready():
	pass # Replace with function body.

func fight():
	var player_coins = player.flip_coins()
	var enemy_coins = enemy.flip_coins()
	var player_score = player_coins['heads']
	var enemy_score = enemy_coins['heads']
	
	if player_score > enemy_score:
		return [PLAYER, player_score, enemy_score]
	elif player_score < enemy_score:
		return [ENEMY, player_score, enemy_score]
	else:
		return [TIE, player_score, enemy_score]

func get_player():
	return player

func set_player(new_player):
	player = new_player

func get_enemy():
	return enemy

func set_enemy(new_enemy):
	enemy = new_enemy

