extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "cat";
    self.fetch_quest = {
        start_signal = 'cat_quest',
        end_signal = 'cat_complete',
        quest = CatQuest.new(),
       };

func _ready():
    model = get_node("FrogModel/frog_mascot");
    original_material = get_node("FrogModel/frog_mascot").get_surface_material(0).duplicate();
