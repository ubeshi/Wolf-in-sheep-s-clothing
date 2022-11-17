extends PlayerItem

class_name Haybale

func _init():
    self.icon_image_large = "res://assets/items/pudding/pudding-large.png";
    self.icon_image_small = "res://assets/items/pudding/pudding-small.png";
    self.label = "Bale Ledger";
    self.description = "Do you wanna know how I got these hay?";

func _ready():
    self.model = get_node("HaybaleModel/10453_Round_Box_Hedge_v1_Iteration3");
    self.original_material = get_node("HaybaleModel/10453_Round_Box_Hedge_v1_Iteration3").get_surface_material(0).duplicate();
