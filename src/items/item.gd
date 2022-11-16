extends Node

class_name PlayerItem

var icon_image_small: String;
var icon_image_large: String;
var label: String;
var description: String;
var quest_id: int;

func _ready() -> void:
    if (Inventory.is_item_picked_up(self)):
        self.visible = false;

func pick_up_item() -> void:
    self.visible = false;
    Inventory.add_item(self);
