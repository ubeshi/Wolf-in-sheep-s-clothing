extends Spatial

func _ready() -> void:
    # Add item menu
    add_scene("res://scenes/user-interface/item-menu.tscn");
    # Add ui scene
    add_scene("res://scenes/ui.tscn");

func add_scene(path: String) -> void:
    var scene = load(path);
    var node = scene.instance();
    add_child(node);
