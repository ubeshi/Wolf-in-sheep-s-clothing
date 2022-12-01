extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "bunny";
    self.fetch_quest = {
        start_signal = 'bunny_quest',
        end_signal = 'bunny_complete',
        quest = BunnyQuest.new()
       };

func _ready():
    model = get_node("BunnyModel/1");
    original_material = get_node("BunnyModel/1").get_surface_material(4).duplicate();
    surface_material = 4;

func add_hint(character_name) -> void:
    if (character_name == self.npc):
        CulpritHints.add_bunny_hint();
