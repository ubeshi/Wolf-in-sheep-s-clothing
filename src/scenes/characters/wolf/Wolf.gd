extends StaticBody

onready var model = get_node("WolfModel/aleu001");
onready var original_material = get_node("WolfModel/aleu001").get_surface_material(0).duplicate();

func hover_focus() -> void:
    var material = original_material.duplicate();
    material.albedo_color = Color(255, 0, 0, 0.6);
    model.set_surface_material(0, material);

func hover_unfocus() -> void:
    model.set_surface_material(0, original_material);

func interact() -> void:
    # TODO: Add in dialogic here
    print('awoof');
