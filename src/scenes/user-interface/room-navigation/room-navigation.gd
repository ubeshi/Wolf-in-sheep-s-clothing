extends Control

const rooms = ["Study", "Foyer", "Kitchen", "LivingRoom", "Cellar", "Garden"];
onready var rooms_menu_body_node = get_node("CanvasLayer/RoomsMenu/MarginContainer/ColorRect/MarginContainer/RoomSelectMenuBody");
var active_room = null setget set_active_room;

signal switch_room(room);

func _ready() -> void:
    initialize_open_rooms_menu_button();
    initialize_close_rooms_menu_button();
    set_active_room("Foyer");

func set_active_room(value) -> void:
    active_room = value;
    if active_room in rooms:
        var room_buttons = get_tree().get_nodes_in_group("Rooms");
        for button in room_buttons:
            if button.name == "Button" + active_room + "Menu":
                button.disabled = true;
            else:
                button.disabled = false;

func initialize_open_rooms_menu_button() -> void:
    var button = get_node("CanvasLayer/UI/MarginContainer/ButtonOpenRoomsMenu");
    button.connect("pressed", self, "handle_open_rooms_menu_button_pressed");

func initialize_close_rooms_menu_button() -> void:
    var button = rooms_menu_body_node.get_node("RoomsMenuActions/ButtonCloseRoomsMenu");
    button.connect("pressed", self, "handle_close_rooms_menu_button_pressed");

func handle_open_rooms_menu_button_pressed() -> void:
    var rooms_menu_node = get_node("CanvasLayer/RoomsMenu");
    rooms_menu_node.set_physics_process(true);
    rooms_menu_node.set_process_input(true);
    rooms_menu_node.visible = true;

func handle_close_rooms_menu_button_pressed() -> void:
    var rooms_menu_node = get_node("CanvasLayer/RoomsMenu");
    rooms_menu_node.set_physics_process(false);
    rooms_menu_node.set_process_input(false);
    rooms_menu_node.visible = false;

func _on_ButtonGardenMenu_pressed():
    emit_signal("switch_room", "garden");
    set_active_room("Garden");
    handle_close_rooms_menu_button_pressed();

func _on_ButtonFoyerMenu_pressed():
    emit_signal("switch_room", "foyer");
    set_active_room("Foyer");
    handle_close_rooms_menu_button_pressed();

func _on_ButtonLivingRoomMenu_pressed():
    emit_signal("switch_room", "living-room");
    set_active_room("LivingRoom");
    handle_close_rooms_menu_button_pressed();
