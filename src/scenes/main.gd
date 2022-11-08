extends Spatial

func _ready() -> void:
	# Add item menu
	add_scene("res://scenes/user-interface/item-menu/item-menu.tscn");
	add_scene("res://scenes/user-interface/navigation/navigation.tscn");
	# Add debug scene
	add_scene("res://scenes/foyer.tscn");

func add_scene(path: String) -> void:
	var scene = load(path);
	var node = scene.instance();
	add_child(node);
