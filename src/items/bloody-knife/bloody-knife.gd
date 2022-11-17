extends PlayerItem

class_name BloodyKnife

func _init():
    self.icon_image_large = "res://assets/items/bloody-knife/bloody-knife-large.png";
    self.icon_image_small = "res://assets/items/bloody-knife/bloody-knife-small.png";
    self.label = "Bloody Knife";
    self.description = "A kitchen knife with blood on it. The blood is still fresh, better not stain my suit.";

func _ready():
    self.model = get_node("BloodyKnifeModel/blade");
    self.original_material = get_node("BloodyKnifeModel/blade").get_surface_material(0).duplicate();
