extends Spatial

var room_navigation = null;
var active_room = null;
var active_room_name = "";

func _ready() -> void:
    # Add UI
    add_rooms();
    add_scene("res://scenes/user-interface/item-menu/item-menu.tscn");
    add_scene("res://scenes/user-interface/navigation/navigation.tscn");

    # Add debug scene
    on_switch_room("foyer");

func add_scene(path: String) -> void:
    var scene = load(path);
    var node = scene.instance();
    add_child(node);

func add_rooms() -> void:
    var room_navigation = load("res://scenes/user-interface/room-navigation/room-navigation.tscn").instance();
    room_navigation.connect("switch_room", self, "on_switch_room");
    add_child(room_navigation);

func on_switch_room(new_room_name) -> void:
    if new_room_name != active_room_name:
        active_room_name = new_room_name;

        if active_room:
            remove_child(active_room);

        var scene = load("res://scenes/rooms/" + active_room_name + ".tscn");
        active_room = scene.instance();
        add_child(active_room);
