extends Control

var held_items = Inventory.held_items;
var empty_item = EmptyItem.new();
onready var items_menu_body_node = get_node("CanvasLayer/ItemsMenu/MarginContainer/ColorRect/MarginContainer/ItemsMenuBody");

func _ready() -> void:
	add_initial_items();
	initialize_open_items_menu_button();
	initialize_close_items_menu_button();

func add_initial_items() -> void:
	var bloody_knife = BloodyKnife.new();
	held_items.append(bloody_knife);

func initialize_open_items_menu_button() -> void:
	var button = get_node("CanvasLayer/UI/MarginContainer/ButtonOpenItemsMenu");
	button.connect("pressed", self, "handle_open_items_menu_button_pressed");

func handle_open_items_menu_button_pressed() -> void:
	var items_menu_node = get_node("CanvasLayer/ItemsMenu");
	items_menu_node.visible = true;

	if held_items.size() > 0:
		set_selected_item(held_items[0]);
	else:
		set_selected_item(empty_item);

	var item_list_node = items_menu_body_node.get_node("ItemList");
	var buttons = get_item_list_buttons(held_items);
	for button in buttons:
		item_list_node.add_child(button);

func initialize_close_items_menu_button() -> void:
	var button = items_menu_body_node.get_node("ItemsMenuActions/ButtonCloseItemsMenu");
	button.connect("pressed", self, "handle_close_items_menu_button_pressed");

func handle_close_items_menu_button_pressed() -> void:
	var items_menu_node = get_node("CanvasLayer/ItemsMenu");
	items_menu_node.visible = false;

	var item_list_node = items_menu_body_node.get_node("ItemList");
	for item in item_list_node.get_children():
		item_list_node.remove_child(item);
		item.queue_free();

func get_item_list_buttons(items: Array) -> Array:
	var buttons = [];
	for item in items:
		var button = TextureButton.new();
		var texture = load(item.icon_image_small);
		button.texture_normal = texture;
		button.connect("pressed", self, "set_selected_item", [item]);
		buttons.append(button);
	return buttons;

func set_selected_item(item: PlayerItem) -> void:
	var selectedItemNode = items_menu_body_node.get_node("SelectedItem");
	var selectedItemImageNode = selectedItemNode.get_node("ItemImage");
	var selectedItemLabelNode = selectedItemNode.get_node("ItemText/ItemLabel");
	var selectedItemDescriptionNode = selectedItemNode.get_node("ItemText/ItemDescription");
	
	selectedItemImageNode.texture = load(item.icon_image_large);
	selectedItemLabelNode.text = item.label;
	selectedItemDescriptionNode.text = item.description;
