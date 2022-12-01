extends PlayerItem

class_name Backpack

func _init():
    self.icon_image_large = "res://assets/items/backpack/backpack.jpg";
    self.icon_image_small = "res://assets/items/backpack/backpack.jpg";
    self.label = "Unknown Backpack";
    self.description = "Backpack at the crime scene. Unsure of who it belongs to.";

func _ready():
    self.model = get_node("BackpackModel/12305_backpack_v2_l3");
    self.original_material = get_node("BackpackModel/12305_backpack_v2_l3").get_surface_material(0).duplicate();
