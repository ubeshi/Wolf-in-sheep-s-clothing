extends PlayerItem

class_name EmptyItem

func _init():
	self.icon_image_large = "res://assets/items/empty-item/empty-item-large.png";
	self.icon_image_small = "res://assets/items/empty-item/empty-item-small.png";
	self.label = "You have no items";
	self.description = "";
