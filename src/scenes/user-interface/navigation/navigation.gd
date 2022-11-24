extends Control

var camera_pivot;
var camera_rotation;
export var lerp_speed = 0.05;

func _ready() -> void:
    camera_pivot = get_node("CameraPivot");
    camera_rotation = camera_pivot.rotation;
    initialize_arrow_menu_buttons();

func _process(_delta):
    camera_pivot.rotation.y = lerp(camera_pivot.rotation.y, camera_rotation.y, lerp_speed);

func initialize_arrow_menu_buttons() -> void:
    var left_button = get_node("CanvasLayer/ArrowContainer/LeftArrow");
    var right_button = get_node("CanvasLayer/ArrowContainer/RightArrow");
    left_button.connect("pressed", self, "handle_left_navigation_button_pressed");
    right_button.connect("pressed", self, "handle_right_navigation_button_pressed");

func handle_left_navigation_button_pressed() -> void:
    set_camera_position(-1);

func handle_right_navigation_button_pressed() -> void:
    set_camera_position(1);

func set_camera_position(rotation) -> void:
    camera_rotation.y += rotation*PI/2;

func _on_LeftButton_pressed() -> void:
    set_camera_position(-1);

func _on_RightButton_pressed() -> void:
    set_camera_position(1);
