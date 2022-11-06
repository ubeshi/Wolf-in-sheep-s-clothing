extends Spatial

var exploration_ui = preload("res://scenes/user-interface/item-menu.tscn");
var ui = preload("res://scenes/ui.tscn");

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    # Add exploration ui
    var exploration_ui_node = exploration_ui.instance();
    add_child(exploration_ui_node);
    # Enter ui scene
    var ui_node = ui.instance();
    add_child(ui_node);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
