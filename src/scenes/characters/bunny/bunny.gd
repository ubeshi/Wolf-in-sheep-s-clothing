extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "bunny";
    self.fetch_quest = {
        start_signal = 'bunny_quest',
        end_signal = 'bunny_complete',
        quest = BunnyQuest.new(),
        item = Pudding.new().label  # Bag.new().label
       };

func _ready():
    model = get_node("BunnyModel/bunnyMesh");
    original_material = get_node("BunnyModel/bunnyMesh").get_surface_material(0).duplicate();
