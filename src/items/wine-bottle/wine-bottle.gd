extends PlayerItem

class_name WineBottle

func _init():
    self.icon_image_large = "res://assets/items/pudding/pudding-large.png";
    self.icon_image_small = "res://assets/items/pudding/pudding-small.png";
    self.label = "Wine Bottle";
    self.description = "I'll stay until the sun comes down, down, down.";

func _ready():
    self.model = get_node("WineBottleModel/wine_mesh");
    self.original_material = get_node("WineBottleModel/wine_mesh").get_surface_material(0).duplicate();
