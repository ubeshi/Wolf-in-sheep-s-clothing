extends Spatial

var exploration_ui = preload("res://scenes/user-interface/item-menu.tscn");
var ui = preload("res://scenes/ui.tscn");
var ui_node;

func _ready() -> void:
    # Add exploration ui
    var exploration_ui_node = exploration_ui.instance();
    exploration_ui_node.connect("navigate_left", self, "on_navigate_left");
    exploration_ui_node.connect("navigate_right", self, "on_navigate_right");
    add_child(exploration_ui_node);

    # Enter ui scene
    ui_node = ui.instance();
    add_child(ui_node);

func on_navigate_left() -> void:
    ui_node.set_camera_position(-1);
    
func on_navigate_right() -> void:
    ui_node.set_camera_position(1);
