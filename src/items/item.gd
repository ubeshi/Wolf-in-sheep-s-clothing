extends Node

class_name PlayerItem

var icon_image_small: String;
var icon_image_large: String;
var label: String;
var description: String;

func pickUpItem() -> void:
    if (!GameState.is_in_interaction()):
        self.visible = false;
        Inventory.add_item(self);
