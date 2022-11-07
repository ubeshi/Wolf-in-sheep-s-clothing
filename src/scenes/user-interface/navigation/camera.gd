extends Camera

func _ready():
    pass # Replace with function body.

var mouse = Vector2();

func _input(event):
    if event is InputEventMouse:
        mouse = event.position;
        get_hover_selection();
    if event is InputEventMouseButton and event.pressed:
        if event.button_index == BUTTON_LEFT:
            get_click_selection();

func get_hover_selection() -> void:
    var worldspace = get_world().direct_space_state;
    var start = project_ray_origin(mouse);
    var end = project_position(mouse, 1000);
    var result = worldspace.intersect_ray(start, end);

    var characters = get_tree().get_nodes_in_group("Characters");
    for character in characters:
        character.hover_unfocus();
        
    if result and (result.collider.name == 'Wolf' or result.collider.name == 'Iguana'):
        result.collider.hover_focus();

func get_click_selection() -> void:
    var worldspace = get_world().direct_space_state;
    var start = project_ray_origin(mouse);
    var end = project_position(mouse, 1000);
    var result = worldspace.intersect_ray(start, end);

    if result and (result.collider.name == 'Wolf' or result.collider.name == 'Iguana'):
        result.collider.interact();
