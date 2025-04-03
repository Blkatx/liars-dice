extends Node2D

const DICE_SCENE:PackedScene = preload("res://dice.tscn")

@export var dice_ammount:int = 6;
@export var tray_size:Vector2 = Vector2(256,512); ## TEMPORARY, MAYBE MAKE A RETANGLE IN EDITOR TO DEFINE THIS

var tray:Array[Dice] = []
var results:Array[int] = []

func _ready()->void:
	for i in range(dice_ammount):
		var die = DICE_SCENE.instantiate();
		tray.append( die );
		self.add_child( die );
	position_dice()

func _input(event):
	## Só comentar aqui que, idealmente, a gente deveria unificar o input da bandeja e do dado,
	## para ser uma coisa só, fica mais facil de fazer a manutenção eu acho.
	if event.is_action_pressed("throw"):
		results.clear() ##Otherwise it keeps acumullating;
		for die in tray:
			results.append(die.face);
		##Old implementation, for reference;
		#tray = [dice1.face, dice2.face, dice3.face, dice4.face, dice5.face, dice6.face]
		print(results)

func position_dice():
	## For now two dice per row;
	for i in range(tray.size()):
		## (numero do dado % numero de colunas) * (lagura da bandeja / (numero de dados/ ???))
		tray[i].position.x = (i%2) * tray_size.x; #Nesse caso, como o resultado só pode ser 0 e 1, não tem problema ser só "(* tray_size.x)"
		## (numero do dado/numero de colunas) * (altura da bandeja / (numero de dados/numero de colunas))
		tray[i].position.y = (i/2) * (tray_size.y/(dice_ammount/2));
	pass
