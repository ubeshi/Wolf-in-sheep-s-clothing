extends "res://scenes/characters/character.gd";

func _ready():
	model = get_node("IguanaModel/10668_Iguana_v2");
	original_material = get_node("IguanaModel/10668_Iguana_v2").get_surface_material(0).duplicate();
