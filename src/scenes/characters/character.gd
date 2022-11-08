extends StaticBody

onready var model;
onready var original_material;

func hover_focus() -> void:
    var material = original_material.duplicate();
    material.albedo_color = Color(255, 0, 0, 0.6);
    model.set_surface_material(0, material);

func hover_unfocus() -> void:
    model.set_surface_material(0, original_material);

func interact() -> void:
    pass;
