extends Node

const held_items = [];

func add_item(item: PlayerItem) -> void:
    held_items.append(item);