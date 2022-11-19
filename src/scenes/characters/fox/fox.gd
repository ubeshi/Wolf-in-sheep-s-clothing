extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "fox";
    self.fetch_quest = {
        start_signal = 'fox_quest',
        end_signal = 'fox_complete',
        quest = FoxQuest.new()
       };

func _ready():
    model = get_node("FoxModel/foxMesh");
    original_material = get_node("FoxModel/foxMesh").get_surface_material(0).duplicate();
