extends "res://scenes/characters/character.gd";

func _ready():
    model = get_node("WolfModel/aleu001");
    original_material = get_node("WolfModel/aleu001").get_surface_material(0).duplicate();

