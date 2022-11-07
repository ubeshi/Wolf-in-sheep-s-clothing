extends StaticBody

onready var model = get_node("WolfModel/aleu001");
onready var shader = model.get_active_material(0).next_pass;
var targeted = false setget set_targeted;

func set_targeted(value):
    if targeted != value:
        targeted = value;
        if targeted:
            shader.set_shader_param("strength", 1);
            pass;
        else:
            shader.set_shader_param("strength", 0);
            pass;

func hover_focus() -> void:
    set_targeted(true);

func hover_unfocus() -> void:
    set_targeted(false);
    
func interact() -> void:
    # TODO: Add in dialogic here
    print('awoof');
