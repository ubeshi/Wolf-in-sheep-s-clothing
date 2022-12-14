extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "horse";
    self.fetch_quest = {
        start_signal = '',
        end_signal = '',
        quest = EmptyQuest.new()
       };

func _ready():
    model = get_node("HorseModel/16267_American_Paint_Horse_Nuetral_new");
    original_material = get_node("HorseModel/16267_American_Paint_Horse_Nuetral_new").get_surface_material(0).duplicate();
