extends Node

class_name PlayerItem

var icon_image_small: String;
var icon_image_large: String;
var label: String;
var description: String;
var model: MeshInstance;
var original_material: Material;

func _ready() -> void:
    if (Inventory.is_item_picked_up(self)):
        self.visible = false;

func pick_up_item() -> void:
    self.visible = false;
    Inventory.add_item_if_not_yet_picked_up(self);

func hover_focus() -> void:
    var material = self.original_material.duplicate();
    material.albedo_color = Color(100, 1000, 0, 0.6);
    self.model.set_surface_material(0, material);

func hover_unfocus() -> void:
    self.model.set_surface_material(0, self.original_material);
