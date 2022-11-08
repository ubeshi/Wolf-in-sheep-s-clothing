extends "res://scenes/characters/character.gd";

onready var npc = "iguana";
onready var dialog_index = 0;

func _ready():
	model = get_node("IguanaModel/10668_Iguana_v2");
	original_material = get_node("IguanaModel/10668_Iguana_v2").get_surface_material(0).duplicate();

func interact() -> void:
	var dialog = Dialogic.start(npc + str(dialog_index));
	get_parent().add_child(dialog);
