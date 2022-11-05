extends Spatial

var exploration_ui = preload("res://scenes/user-interface/exploration-ui.tscn");
var foyer_scene = preload('res://scenes/foyer.tscn');

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    # Add exploration ui
    var exploration_ui_node = exploration_ui.instance();
    add_child(exploration_ui_node);
    # Enter foyer scene
    var foyer_scene_node = foyer_scene.instance();
    add_child(foyer_scene_node);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
