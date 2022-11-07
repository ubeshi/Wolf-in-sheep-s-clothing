extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

var mouse = Vector2();

func _input(event):
    if event is InputEventMouse:
        mouse = event.position;
    if event is InputEventMouseButton and event.pressed:
        if event.button_index == BUTTON_LEFT:
            get_selection();

func get_selection():
    var worldspace = get_world().direct_space_state;
    var start = project_ray_origin(mouse);
    var end = project_position(mouse, 1000);
    var result = worldspace.intersect_ray(start, end);

    if result and result.collider.name == 'wolf':
        print('awoo')
