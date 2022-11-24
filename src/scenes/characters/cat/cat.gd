extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "cat";
    self.fetch_quest = {
        start_signal = 'cat_quest',
        end_signal = 'cat_complete',
        quest = CatQuest.new()
       };

func _ready():
    model = get_node("CatModel/12221_Cat_v1_l3");
    original_material = get_node("CatModel/12221_Cat_v1_l3").get_surface_material(0).duplicate();
