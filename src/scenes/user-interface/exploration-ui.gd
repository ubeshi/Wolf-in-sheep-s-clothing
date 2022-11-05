extends Control

func _ready():
    initialize_open_items_menu_button();
    initialize_close_items_menu_button();

func initialize_open_items_menu_button() -> void:
    var button = get_node("CanvasLayer/UI/MarginContainer/ButtonOpenItemsMenu");
    button.connect("pressed", self, "handle_open_items_menu_button_pressed");

func handle_open_items_menu_button_pressed() -> void:
    var items_menu_node = get_node("CanvasLayer/ItemsMenu");
    items_menu_node.visible = true;

func initialize_close_items_menu_button() -> void:
    var button = get_node("CanvasLayer/ItemsMenu/MarginContainer/ItemsMenuBody/ItemsMenuActions/ButtonCloseItemsMenu");
    button.connect("pressed", self, "handle_close_items_menu_button_pressed");

func handle_close_items_menu_button_pressed() -> void:
    var items_menu_node = get_node("CanvasLayer/ItemsMenu");
    items_menu_node.visible = false;
