extends Node

var current_scene = null;

func _ready():
    var root = get_tree().root;
    current_scene = root.get_child(root.get_child_count() - 1);

func go_to_scene(path):
    call_deferred("_deferred_goto_scene", path);

func deferred_go_to_scene(path):
    current_scene.free();
    var s = ResourceLoader.load(path);
    current_scene = s.instance();
    get_tree().root.add_child(current_scene);
