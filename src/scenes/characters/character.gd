extends Node

onready var model;
onready var original_material;
onready var dialog_index = 0;
onready var npc;

func hover_focus() -> void:
    var material = original_material.duplicate();
    material.albedo_color = Color(255, 0, 0, 0.6);
    model.set_surface_material(0, material);

func hover_unfocus() -> void:
    model.set_surface_material(0, original_material);

func interact() -> void:
    if (!GameState.is_in_interaction()):
        GameState.set_is_in_dialogue(true);
        var dialog = Dialogic.start(npc + str(dialog_index));
        dialog.connect("timeline_end", self, "dialog_ended");
        add_child(dialog);

func dialog_ended(_timeline_name) -> void:
    GameState.set_is_in_dialogue(false);
