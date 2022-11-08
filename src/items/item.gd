extends Node

class_name PlayerItem

var icon_image_small: String;
var icon_image_large: String;
var label: String;
var description: String;

func pickUpItem() -> void:
	self.queue_free();
	emit_signal('add_item', self);
	
