extends Node2D

var face = 0

# Should this be here?
func _ready() -> void:
	%Dice_Animation.play("idle")
	
func _process(delta):
	pass

# Animates dice throwing. 
# Displays right face after calculating random throw.
func throw_dice():
	%Dice_Animation.play("throw")
	face = randi_range(1,6)

func show_face():
	if face in range(1, 7):
		%Dice_Animation.play("%d" % face)

func _input(event):
	if event.is_action_pressed("throw"):
		throw_dice()
	if event.is_action_released("throw"):
		%Dice_Timer.wait_time = 0.2
		%Dice_Timer.one_shot = true
		%Dice_Timer.start()
		


func _on_dice_timer_timeout() -> void:
	show_face()
