extends "res://scenes/characters/character.gd";

onready var npc = "wolf";
onready var dialog_index = 0;

func _ready():
	model = get_node("WolfModel/aleu001");
	original_material = get_node("WolfModel/aleu001").get_surface_material(0).duplicate();

func interact() -> void:
	var dialog = Dialogic.start(npc + str(dialog_index));
	get_parent().add_child(dialog);
