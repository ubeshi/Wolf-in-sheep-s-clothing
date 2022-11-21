extends Menu

var held_items = Inventory.held_items;
var empty_item = EmptyItem.new();

var items_menu_body_node_path = "CanvasLayer/ItemsMenu/MarginContainer/ColorRect/MarginContainer/ItemsMenuBody";
onready var items_menu_body_node = get_node(items_menu_body_node_path);

func _init() -> void:
    self.open_menu_button_path = "CanvasLayer/UI/MarginContainer/ButtonOpenItemsMenu";
    self.close_menu_button_path = items_menu_body_node_path + "/ItemsMenuActions/ButtonCloseItemsMenu";
    self.menu_path = "CanvasLayer/ItemsMenu";

func _ready() -> void:
    # add_placeholder_items();
    pass;

func add_placeholder_items() -> void:
    var bloody_knife = BloodyKnife.new();
    held_items.append(bloody_knife);

func handle_menu_opened() -> void:
    if held_items.size() > 0:
        set_selected_item(held_items[0]);
    else:
        set_selected_item(empty_item);

    var item_list_node = items_menu_body_node.get_node("ItemList");
    var buttons = get_item_list_buttons(held_items);
    for button in buttons:
        item_list_node.add_child(button);

func handle_menu_closed() -> void:
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
