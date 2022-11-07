extends StaticBody

onready var model = get_node("WolfModel/aleu001");

func hover_focus() -> void:
    for index in model.get_surface_material_count():
        var material = model.get_active_material(index).duplicate();
        material.albedo_color = Color(255, 0, 0, 1);
        model.set_surface_material(index, material);

func hover_unfocus() -> void:
    for index in model.get_surface_material_count():
        var material = model.get_active_material(index).duplicate();
        material.albedo_color = Color(0, 0, 0, 1);
        model.set_surface_material(index, material);

func interact() -> void:
    # TODO: Add in dialogic here
    print('awoof');
