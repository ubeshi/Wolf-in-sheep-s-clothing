extends Node

const held_items = [];

const picked_up_items = [];

func add_item(item: PlayerItem) -> void:
    held_items.append(item);
    picked_up_items.append(item.label);

func is_item_picked_up(item: PlayerItem) -> bool:
    return picked_up_items.has(item.label);

func remove_item(item: PlayerItem) -> void:
    for held in held_items:
        if held.label == item.label:
           held_items.erase(held);

func add_item_if_not_yet_picked_up(item: PlayerItem) -> void:
    if !is_item_picked_up(item):
        add_item(item);
