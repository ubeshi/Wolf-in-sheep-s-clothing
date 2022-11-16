extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "frog";
    self.fetch_quest = {
        start_signal = 'cat_frog_quest',
        end_signal = 'cat_frog_complete',
        quest = CatQuest.new(),
        item = 'wine bottle'    # Wine.new().label
       };

func _ready():
    model = get_node("FrogModel/frog_mascot");
    original_material = get_node("FrogModel/frog_mascot").get_surface_material(0).duplicate();
