extends StaticBody

onready var original_material = get_node("WolfModel/aleu001").get_active_material(0).duplicate();

func hover_focus() -> void:
    var material = get_node("WolfModel/aleu001").get_active_material(0).duplicate();
    material.albedo_color = Color(255, 0, 0, 255);
    get_node("WolfModel/aleu001").set_surface_material(0, material);

func hover_unfocus() -> void:
    get_node("WolfModel/aleu001").set_surface_material(0, original_material);

func interact() -> void:
    # TODO: Add in dialogic here
    print('awoof');
