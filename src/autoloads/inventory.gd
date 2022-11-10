extends Node

const held_items = [];

const picked_up_items = [];

func add_item(item: PlayerItem) -> void:
    held_items.append(item);
    picked_up_items.append(item.label);

func is_item_picked_up(item: PlayerItem) -> bool:
    return picked_up_items.has(item.label);
