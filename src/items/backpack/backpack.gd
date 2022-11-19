extends PlayerItem

class_name Backpack

func _init():
    self.icon_image_large = "res://assets/items/pudding/pudding-large.png";
    self.icon_image_small = "res://assets/items/pudding/pudding-small.png";
    self.label = "Backpack";
    self.description = "I don't know how we're gonna build a castle now.";

func _ready():
    self.model = get_node("BackpackModel/12305_backpack_v2_l3");
    self.original_material = get_node("BackpackModel/12305_backpack_v2_l3").get_surface_material(0).duplicate();
