extends Node2D

func _ready():
	var play = Button.new()
	play.custom_minimum_size = Vector2(400, 100)
	play.connect("button_up", on_play_button_up)
	play.text = "Play"

	var quit = Button.new()
	quit.custom_minimum_size = Vector2(400, 100)
	quit.connect("button_up", on_quit_button_up)
	quit.text = "Quit"

	var vbox = VBoxContainer.new()
	vbox.add_child(play)
	vbox.add_child(quit)

	var centered = CenterContainer.new()
	centered.set_size(get_viewport().size)
	centered.add_child(vbox)

	add_child(centered)

func on_play_button_up():
	print("Let's play!")

func on_quit_button_up():
	get_tree().quit()
