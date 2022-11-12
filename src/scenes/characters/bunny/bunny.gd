extends "res://scenes/characters/character.gd";

onready var npc = "bunny";
onready var dialog_index = 0;

func _ready():
    model = get_node("BunnyModel/bunnyMesh");
    original_material = get_node("BunnyModel/bunnyMesh").get_surface_material(0).duplicate();

func interact() -> void:
    var dialog = Dialogic.start(npc + str(dialog_index));
    dialog_index += 1
    get_parent().add_child(dialog);
