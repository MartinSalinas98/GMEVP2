extends Node2D 

# Declaring variables
var food
signal asked_for_food

# Called when the node enters the scene tree for the first time.
func _ready():
	food = get_node("Food")
	set_process_input(true)
	# warning-ignore:return_value_discarded
	connect("asked_for_food", food, "_on_World_asked_for_food")

# Called every time an input is received
func _input(event):
	if event is InputEventKey and event.scancode == KEY_F:
		emit_signal("asked_for_food")
