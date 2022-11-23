extends Spatial

var active_room = null;
var active_room_name = "";

var introduction_scene;
var story_scene_one_scene;
var study_intro_scene;
var item_menu;
var culprit_menu;
var navigation;
var win_lose_scene;

func _ready() -> void:
    start_scene(Configuration.initial_scene);

func start_scene(scene) -> void:
    match (scene):
        Configuration.Scene.INTRO:
            start_introduction();
        Configuration.Scene.STORY_SCENE_ONE:
            start_story_scene_one();
        Configuration.Scene.STUDY_INTRO:
            start_study_intro();
        Configuration.Scene.INVESTIGATION:
            start_investigation();
        Configuration.Scene.WIN_LOSE:
            start_win_lose();

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
    item_menu = add_scene("res://scenes/user-interface/item-menu/item-menu.tscn");
    # warning-ignore:return_value_discarded
    culprit_menu = add_scene("res://scenes/user-interface/culprit-menu/culprit-menu.tscn");
    # warning-ignore:return_value_discarded
    navigation = add_scene("res://scenes/user-interface/navigation/navigation.tscn");
    # Add debug scene
    on_switch_room("foyer");

    # add connection for start_win_lose();

func add_scene(path: String) -> Node:
    var scene = load(path);
    var node = scene.instance();
    add_child(node);
    return node;

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

func start_win_lose() -> void:
    remove_child(item_menu);
    remove_child(culprit_menu);
    remove_child(navigation);
    win_lose_scene = add_scene('res://scenes/win-lose/win_lose.tscn');
