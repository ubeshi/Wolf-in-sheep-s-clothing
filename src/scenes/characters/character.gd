extends Node

onready var model;
onready var original_material;
onready var surface_material = 0;
onready var npc;
onready var fetch_quest;

func hover_focus() -> void:
    var material = original_material.duplicate();
    material.albedo_color = Color(255, 0, 0, 0.6);
    model.set_surface_material(surface_material, material);

func hover_unfocus() -> void:
    model.set_surface_material(surface_material, original_material);

func interact() -> void:
    if (!GameState.is_in_interaction()):
        GameState.set_is_in_dialogue(true);
        var quest_in_progress = check_quest_status();
        if (quest_in_progress):
            GameState.set_is_in_dialogue(false);
            return;
        var index = Dialogic.get_variable(npc + '_index');
        var dialog = Dialogic.start(npc + str(index));
        dialog.connect("timeline_end", self, "dialog_ended");
        dialog.connect("dialogic_signal", self, "dialogic_signal_event");
        add_child(dialog);

func check_quest_status() -> bool:
    for quest in Quests.quest_list:
        if quest.label == fetch_quest.quest.label:
            for item in Inventory.held_items:
                if item.label == fetch_quest.quest.item.label:
                    Dialogic.set_variable(npc + '_quest_complete', true);
                    return false;
            return true;
    return false;

func dialog_ended(timeline_name) -> void:
    GameState.set_is_in_dialogue(false);
    var timeline_name_length = timeline_name.length();
    var timeline_number = int(timeline_name[timeline_name_length - 1]);
    if (timeline_number == 2):
        # If timeline_number == 2, no new hints are provided in the corresponding dialog
        return;
    var character_name = timeline_name.left(timeline_name_length - 1);
    add_hint(character_name);

# Override in child class
func add_hint(_character_name) -> void:
    pass;

func dialogic_signal_event(event):
    if event == fetch_quest.start_signal:
        Quests.add_quest(fetch_quest.quest);
    if event == fetch_quest.end_signal:
        Inventory.remove_item(fetch_quest.quest.item);
        Quests.remove_quest(fetch_quest.quest);
