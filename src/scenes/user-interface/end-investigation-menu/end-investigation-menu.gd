extends Menu

signal opened_menu(menu);
signal closed_menu(menu);

var end_investigation_menu_body_node_path = "CanvasLayer/EndInvestigationMenu/MarginContainer/ColorRect/MarginContainer/EndInvestigationMenuBody";
var end_investigation_button_path = end_investigation_menu_body_node_path + "/ButtonEndInvestigation";
onready var end_investigation_button_node = get_node(end_investigation_button_path);

func _init() -> void:
    self.open_menu_button_path = "CanvasLayer/UI/MarginContainer/ButtonEndInvestigationOuter";
    self.close_menu_button_path = end_investigation_menu_body_node_path + "/ButtonContinueInvestigation";
    self.menu_path = "CanvasLayer/EndInvestigationMenu";

func _ready() -> void:
    end_investigation_button_node.connect("pressed", self, "end_investigation");

func handle_menu_opened() -> void:
    emit_signal("opened_menu", "end_investigation_menu");

func handle_menu_closed() -> void:
    emit_signal("closed_menu", "end_investigation_menu");

func end_investigation() -> void:
    StoryController.end_investigation();
