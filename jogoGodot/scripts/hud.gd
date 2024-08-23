extends CanvasLayer

signal sart_game
@onready var score_label = $Control/ScoreLabel
@onready var message_label_2 = $Control/MessageLabel2
@onready var message_timer = $MessageTimer
@onready var start_button = $Control/StartButton

func  show_message(text):
	message_label_2.text = text
	message_label_2.show()
	message_timer.start()
	
func  show_game_over():
	show_message("Gamer Over")
	await message_timer.timeout
	
	message_label_2.text ="Doge The Bugs"
	message_label_2.show()
	
	await get_tree().create_timer(1.0).timeout
	start_button.show()
	
	
func update_score(score):
	score_label.text = str(score)
	
func _on_start_button_pressed():
	start_button.hide()
	sart_game.emit()
	
func _on_message_timer_timeout():
	message_label_2.hide()
