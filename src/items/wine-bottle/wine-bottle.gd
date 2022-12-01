extends PlayerItem

class_name WineBottle

func _init():
    self.icon_image_large = "res://assets/items/wine-bottle/wine-bottle.jpg";
    self.icon_image_small = "res://assets/items/wine-bottle/wine-bottle.jpg";
    self.label = "Wine Bottle";
    self.description = "A wine bottle from the Horse's personal stock. Unopened.";

func _ready():
    self.model = get_node("WineBottleModel/wine_mesh");
    self.original_material = get_node("WineBottleModel/wine_mesh").get_surface_material(0).duplicate();
