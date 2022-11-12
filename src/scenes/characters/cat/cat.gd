extends "res://scenes/characters/character.gd";

func _init():
    self.npc = "cat";

func _ready():
    model = get_node("CatModel/12221_Cat_v1_l3");
    original_material = get_node("CatModel/12221_Cat_v1_l3").get_surface_material(0).duplicate();

func interact() -> void:
    var dialog = Dialogic.start(npc + str(dialog_index));
    dialog_index += 1;
    get_parent().add_child(dialog);
