extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "iguana";
    # test using iguana
    self.fetch_quest = {
        start_signal = 'iguana_quest',
        end_signal = 'iguana_complete',
        quest = BunnyQuest.new(), # temporarily using bunny quest for testing
        item = 'test' # temporarily using Pudding for testing
    };

func _ready():
    model = get_node("IguanaModel/10668_Iguana_v2");
    original_material = get_node("IguanaModel/10668_Iguana_v2").get_surface_material(0).duplicate();
