extends "res://scenes/characters/character.gd";

onready var npc = "horse";
onready var dialog_index = 0;

func _ready():
    model = get_node("HorseModel/16267_American_Paint_Horse_Nuetral_new");
    original_material = get_node("HorseModel/16267_American_Paint_Horse_Nuetral_new").get_surface_material(0).duplicate();

func interact() -> void:
    var dialog = Dialogic.start(npc + str(dialog_index));
    get_parent().add_child(dialog);