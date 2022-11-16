extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "dog";
    self.fetch_quest = {
        start_signal = 'dog_quest',
        end_signal = 'dog_complete',
        quest = DogQuest.new(),
        item = 'tophat'    # TopHat.new().label
       };

func _ready():
    model = get_node("DogModel/dogMesh");
    original_material = get_node("DogModel/dogMesh").get_surface_material(0).duplicate();
