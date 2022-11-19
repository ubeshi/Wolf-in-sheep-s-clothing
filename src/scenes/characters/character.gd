extends Node

onready var model;
onready var original_material;
onready var npc;
onready var fetch_quest;

func hover_focus() -> void:
    var material = original_material.duplicate();
    material.albedo_color = Color(255, 0, 0, 0.6);
    model.set_surface_material(0, material);

func hover_unfocus() -> void:
    model.set_surface_material(0, original_material);

func interact() -> void:
    if (!GameState.is_in_interaction()):
        GameState.set_is_in_dialogue(true);
        if Quests.quest_list.has(fetch_quest.quest) == true:
            for item in Inventory.held_items:
                print('item.label', item.label)
                print('fetch_quest.quest.item.label', fetch_quest.quest.item.label)
                if item.label == fetch_quest.quest.item.label:
                    print('holding quest item')
                    Dialogic.set_variable(npc + '_quest_complete', true)
                    print(npc + 'quest_complete', Dialogic.get_variable(npc + '_quest_complete', true))
        var index = Dialogic.get_variable(npc + '_index');
        print(index);
        var dialog = Dialogic.start(npc + str(index));
        dialog.connect("timeline_end", self, "dialog_ended");
        dialog.connect("dialogic_signal", self, "dialogic_signal_event");
        add_child(dialog);

func dialog_ended(_timeline_name) -> void:
    GameState.set_is_in_dialogue(false);

func dialogic_signal_event(event):
    if event == fetch_quest.start_signal:
        Quests.add_quest(fetch_quest.quest);
    if event == fetch_quest.end_signal:
        Inventory.remove_item(fetch_quest.quest.item);
        Quests.remove_quest(fetch_quest.quest);
