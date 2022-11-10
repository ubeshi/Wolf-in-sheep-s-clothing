extends Node

class_name Menu

var open_menu_button_path;
var close_menu_button_path;
var menu_path;

onready var open_menu_button = get_node(open_menu_button_path);
onready var close_menu_button = get_node(close_menu_button_path);

func _ready() -> void:
    initialize_open_menu_button();
    initialize_close_menu_button();

func initialize_open_menu_button() -> void:
    open_menu_button.connect("pressed", self, "handle_open_menu_button_pressed");

func initialize_close_menu_button() -> void:
    close_menu_button.connect("pressed", self, "handle_close_menu_button_pressed");

func handle_open_menu_button_pressed():
    if (!GameState.is_in_interaction()):
        GameState.set_is_in_menu(true);
        var menu = get_node(menu_path);
        menu.visible = true;
        handle_menu_opened();

func handle_close_menu_button_pressed():
    GameState.set_is_in_menu(false);
    var menu = get_node(menu_path);
    menu.visible = false;
    handle_menu_closed();

# Override in child class
func handle_menu_opened():
    pass;

# Override in child class
func handle_menu_closed():
    pass;
