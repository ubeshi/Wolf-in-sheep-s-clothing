extends Spatial

var exploration_ui = preload("res://scenes/user-interface/item-menu.tscn");
var ui = preload("res://scenes/ui.tscn");

func _ready() -> void:
    # Add exploration ui
    var exploration_ui_node = exploration_ui.instance();
    add_child(exploration_ui_node);
    # Enter ui scene
    var ui_node = ui.instance();
    add_child(ui_node);
