extends StaticBody

func hover_focus() -> void:
    var material = get_node("IguanaModel/10668_Iguana_v2").get_active_material(0).duplicate();
    material.albedo_color = Color(255, 0, 0, 255);
    get_node("IguanaModel/10668_Iguana_v2").set_surface_material(0, material);

func hover_unfocus() -> void:
    var material = get_node("IguanaModel/10668_Iguana_v2").get_active_material(0).duplicate();
    material.albedo_color = Color(255, 53, 53, 255);
    get_node("IguanaModel/10668_Iguana_v2").set_surface_material(0, material);

func interact() -> void:
    # TODO: Add in dialogic here
    print('ribbit');
