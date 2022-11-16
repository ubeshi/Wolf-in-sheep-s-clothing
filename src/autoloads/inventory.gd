extends Node

const held_items = [];

const picked_up_items = [];

func add_item(item: PlayerItem) -> void:
    held_items.append(item);
    picked_up_items.append(item.label);
    for character_quest in Quests.quest_map:
        if item.quest_id == character_quest.id:
            Dialogic.set_variable(character_quest.quest.label + '_quest_complete', true)

func is_item_picked_up(item: PlayerItem) -> bool:
    return picked_up_items.has(item.label);

func remove_item(item_name: String) -> void:
    for item in held_items:
        if item.name == item_name:
           held_items.erase(item);
