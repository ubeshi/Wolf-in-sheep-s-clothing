extends Menu

const rooms = ["Study", "Kitchen", "LivingRoom", "Cellar", "Garden"];

var active_room = null setget set_active_room;

var rooms_menu_body_node_path = "CanvasLayer/RoomsMenu/MarginContainer/ColorRect/MarginContainer/RoomSelectMenuBody"
onready var rooms_menu_body_node = get_node(rooms_menu_body_node_path);

signal switch_room(room);

func _init() -> void:
    self.open_menu_button_path = "CanvasLayer/UI/MarginContainer/ButtonOpenRoomsMenu";
    self.close_menu_button_path = rooms_menu_body_node_path + "/RoomsMenuActions/ButtonCloseRoomsMenu";
    self.menu_path = "CanvasLayer/RoomsMenu";

func _ready() -> void:
    set_active_room("Study");

func set_active_room(value) -> void:
    active_room = value;
    if active_room in rooms:
        var room_buttons = get_tree().get_nodes_in_group("Rooms");
        for button in room_buttons:
            if button.name == "Button" + active_room + "Menu":
                button.disabled = true;
            else:
                button.disabled = false;

func handle_menu_opened() -> void:
    var rooms_menu_node = get_node("CanvasLayer/RoomsMenu");
    rooms_menu_node.set_physics_process(true);
    rooms_menu_node.set_process_input(true);
    rooms_menu_node.visible = true;

func handle_menu_closed() -> void:
    var rooms_menu_node = get_node("CanvasLayer/RoomsMenu");
    rooms_menu_node.set_physics_process(false);
    rooms_menu_node.set_process_input(false);
    rooms_menu_node.visible = false;

func _on_ButtonGardenMenu_pressed():
    emit_signal("switch_room", "garden");
    set_active_room("Garden");
    .handle_close_menu_button_pressed();

func _on_ButtonFoyerMenu_pressed():
    emit_signal("switch_room", "foyer");
    set_active_room("Foyer");
    .handle_close_menu_button_pressed();

func _on_ButtonLivingRoomMenu_pressed():
    emit_signal("switch_room", "living-room");
    set_active_room("LivingRoom");
    .handle_close_menu_button_pressed();

func _on_ButtonStudyMenu_pressed():
    emit_signal("switch_room", "study");
    set_active_room("Study");
    .handle_close_menu_button_pressed();

func _on_ButtonKitchenMenu_pressed():
    emit_signal("switch_room", "kitchen");
    set_active_room("Kitchen");
    .handle_close_menu_button_pressed();

func _on_ButtonCellarMenu_pressed():
    emit_signal("switch_room", "cellar");
    set_active_room("Cellar");
    .handle_close_menu_button_pressed();
