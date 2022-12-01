extends PlayerItem

class_name Haybale

func _init():
    self.icon_image_large = "res://assets/items/haybale/haybale.jpg";
    self.icon_image_small = "res://assets/items/haybale/haybale.jpg";
    self.label = "Loose Haybale";
    self.description = "A bunch of loose hay. The rope binding it is missing.";

func _ready():
    self.model = get_node("HaybaleModel/10453_Round_Box_Hedge_v1_Iteration3");
    self.original_material = get_node("HaybaleModel/10453_Round_Box_Hedge_v1_Iteration3").get_surface_material(0).duplicate();
