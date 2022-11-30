extends PlayerItem

class_name Cake

func _init():
    self.icon_image_large = "res://assets/items/cake/cake.jpg";
    self.icon_image_small = "res://assets/items/cake/cake.jpg";
    self.label = "Cake";
    self.description = "A beautiful carrot cake. Baked by the bunny.";

func _ready():
    self.model = get_node("CakeModel/cake_mesh");
    self.original_material = get_node("CakeModel/cake_mesh").get_surface_material(0).duplicate();
