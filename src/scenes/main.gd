extends Spatial

var exploration_ui = load("res://scenes/user-interface/item-menu.tscn");
# var ui = load("res://scenes/ui.tscn");

func _ready() -> void:
    # Add item menu
    add_scene("res://scenes/user-interface/item-menu.tscn");
    # Add debug scene
    add_scene("res://scenes/debug.tscn");

func add_scene(path: String) -> void:
    var scene = load(path);
    var node = scene.instance();
    add_child(node);
