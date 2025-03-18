extends Node2D

@onready var dice1 = %Dice1
@onready var dice2 = %Dice2
@onready var dice3 = %Dice3
@onready var dice4 = %Dice4
@onready var dice5 = %Dice5
@onready var dice6 = %Dice6

@onready var tray

func _input(event):
	if event.is_action_pressed("throw"):
		tray = [dice1.face, dice2.face, dice3.face, dice4.face, dice5.face, dice6.face]
		print(tray)
