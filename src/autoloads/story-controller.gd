extends Node

var current_scene = null;
var introduction_path = "res://scenes/introduction/introduction.tscn";
var study_intro_path = "res://scenes/study-intro/study-intro.tscn";
var story_scene_one_path = "res://scenes/story-scene-one/story-scene-one.tscn";

var introduction_scene;
var story_scene_one_scene;
var study_intro_scene;

var active_room = null;
var active_room_name = "";

func _init():
    start_introduction();

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

func add_scene(path: String) -> Node:
    var scene = load(path);
    var node = scene.instance();
    add_child(node);
    return node;

func start_introduction() -> void:
    introduction_scene = add_scene("res://scenes/introduction/introduction.tscn");
    introduction_scene.connect("finished", self, "end_introduction");

func end_introduction() -> void:
    remove_child(introduction_scene);
    start_story_scene_one();

func start_story_scene_one() -> void:
    story_scene_one_scene = add_scene("res://scenes/story-scene-one/story-scene-one.tscn");
    story_scene_one_scene.connect("finished", self, "end_story_scene_one");

func end_story_scene_one() -> void:
    remove_child(story_scene_one_scene);
    start_study_intro();

func start_study_intro() -> void:
    study_intro_scene = add_scene("res://scenes/study-intro/study-intro.tscn");
    study_intro_scene.connect("finished", self, "end_study_intro");

func end_study_intro() -> void:
    remove_child(study_intro_scene);
    start_investigation();

func start_investigation() -> void:
    # Add UI
    add_rooms();
    # warning-ignore:return_value_discarded
    add_scene("res://scenes/user-interface/item-menu/item-menu.tscn");
    # warning-ignore:return_value_discarded
    add_scene("res://scenes/user-interface/navigation/navigation.tscn");
    # Add debug scene
    on_switch_room("foyer");


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

