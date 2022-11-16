extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "cat";
    self.fetch_quest = {
        start_signal = 'cat_frog_quest',
        end_signal = 'cat_frog_complete',
        quest = CatQuest.new(),
        item = 'wine bottle'    # Wine.new().label
       };

func _ready():
    model = get_node("CatModel/12221_Cat_v1_l3");
    original_material = get_node("CatModel/12221_Cat_v1_l3").get_surface_material(0).duplicate();
