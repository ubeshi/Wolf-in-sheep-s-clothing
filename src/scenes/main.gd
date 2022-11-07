extends Spatial

var ui_node;

func _ready() -> void:
    # Add item menu
    var exploration_ui_node = add_scene("res://scenes/user-interface/item-menu.tscn");
    exploration_ui_node.connect("navigate_left", self, "on_navigate_left");
    exploration_ui_node.connect("navigate_right", self, "on_navigate_right");
    # Add debug scene
    ui_node = add_scene("res://scenes/ui.tscn");

func add_scene(path: String) -> Node:
    var scene = load(path);
    var node = scene.instance();
    add_child(node);
    return node;

func on_navigate_left() -> void:
    ui_node.set_camera_position(-1);

func on_navigate_right() -> void:
    ui_node.set_camera_position(1);
