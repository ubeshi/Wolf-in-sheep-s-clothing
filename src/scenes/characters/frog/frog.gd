extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "frog";

func _ready():
    model = get_node("FrogModel/frog_mascot");
    original_material = get_node("FrogModel/frog_mascot").get_surface_material(0).duplicate();

func interact() -> void:
    var dialog = Dialogic.start(npc + str(dialog_index));
    get_parent().add_child(dialog);
