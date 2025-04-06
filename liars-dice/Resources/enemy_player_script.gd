class_name EnemyPlayer
extends Control

var player_name:String :
	set(new_name):
		player_name = new_name
		$VBoxContainer/Label.text = new_name
var id:int


func roll_dice()->void:
	##Play animation and get random results from dice.
	pass
