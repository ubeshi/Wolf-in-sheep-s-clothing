extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "bunny";

func _ready():
    model = get_node("BunnyModel/1");
    original_material = get_node("BunnyModel/1").get_surface_material(4).duplicate();
    surface_material = 4;

func interact() -> void:
    var dialog = Dialogic.start(npc + str(dialog_index));
    dialog_index += 1;
    get_parent().add_child(dialog);
