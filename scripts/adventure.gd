extends Node2D

func _ready():
	Global.CUR -= 1

	var lab = Label.new()
	lab.text = Global.ADV.checkpoints[Global.CUR].text
	lab.autowrap_mode = TextServer.AUTOWRAP_WORD
	lab.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

	var vbox = VBoxContainer.new()
	vbox.add_child(lab)
	if len(Global.ADV.checkpoints[Global.CUR].choices) == 0:
		var but = Button.new()
		but.custom_minimum_size = Vector2(500, 75)
		but.text = "Restart"
		but.connect("button_up", func(): go_to_checkpoint(1))
		vbox.add_child(but)
	for cho in Global.ADV.checkpoints[Global.CUR].choices:
		var but = Button.new()
		but.custom_minimum_size = Vector2(500, 75)
		but.text = cho.description
		but.connect("button_up", func(): go_to_checkpoint(cho.outcome))
		vbox.add_child(but)

	var centered = CenterContainer.new()
	centered.set_size(get_viewport().size)
	centered.add_child(vbox)

	add_child(centered)

func go_to_checkpoint(target):
	Global.CUR = target
	get_tree().change_scene_to_file("res://scenes/adventure.tscn")
