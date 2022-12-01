extends PlayerItem

class_name TopHat

func _init():
    self.icon_image_large = "res://assets/items/top-hat/top-hat.jpg";
    self.icon_image_small = "res://assets/items/top-hat/top-hat.jpg";
    self.label = "Top Hat";
    self.description = "A beautiful, intricate top hat. Obviously belongs to someone fancy.";

func _ready():
    self.model = get_node("TopHatModel/12180_Hat_v2_L3");
    self.original_material = get_node("TopHatModel/12180_Hat_v2_L3").get_surface_material(0).duplicate();
