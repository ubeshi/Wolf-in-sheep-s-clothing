extends "res://scenes/characters/character.gd";

onready var npc = "fox";
onready var dialog_index = 0;

func _ready():
    model = get_node("FoxModel/foxMesh");
    original_material = get_node("FoxModel/foxMesh").get_surface_material(0).duplicate();

func interact() -> void:
    var dialog = Dialogic.start(npc + str(dialog_index));
    get_parent().add_child(dialog);
