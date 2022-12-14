extends Menu

var held_items = Inventory.held_items;
var empty_item = EmptyItem.new();

var large_image_size = 256;
var small_image_size = 64;

var items_menu_body_node_path = "CanvasLayer/ItemsMenu/MarginContainer/ColorRect/MarginContainer/ItemsMenuBody";
onready var items_menu_body_node = get_node(items_menu_body_node_path);

func _init() -> void:
    self.open_menu_button_path = "CanvasLayer/UI/MarginContainer/ButtonOpenItemsMenu";
    self.close_menu_button_path = items_menu_body_node_path + "/ItemsMenuActions/ButtonCloseItemsMenu";
    self.menu_path = "CanvasLayer/ItemsMenu";

func handle_menu_opened() -> void:
    emit_signal("opened_menu", "item_menu");
    if held_items.size() > 0:
        set_selected_item(held_items[0]);
    else:
        set_selected_item(empty_item);

    var item_list_node = items_menu_body_node.get_node("ItemList");
    var buttons = get_item_list_buttons(held_items);
    for button in buttons:
        item_list_node.add_child(button);

func handle_menu_closed() -> void:
    emit_signal("closed_menu", "item_menu");
    var item_list_node = items_menu_body_node.get_node("ItemList");
    for item in item_list_node.get_children():
        item_list_node.remove_child(item);
        item.queue_free();

func get_item_list_buttons(items: Array) -> Array:
    var buttons = [];
    for item in items:
        var button = TextureButton.new();

        var small_icon = load(item.icon_image_small);
        var image : Image = small_icon.get_data();
        var image_texture = ImageTexture.new();
        image.resize(small_image_size, small_image_size);
        image_texture.create_from_image(image);
        button.texture_normal = image_texture;

        button.connect("pressed", self, "set_selected_item", [item]);
        buttons.append(button);
    return buttons;

func set_selected_item(item: PlayerItem) -> void:
    var selectedItemNode = items_menu_body_node.get_node("SelectedItem");
    var selectedItemImageNode = selectedItemNode.get_node("ItemImage");
    var selectedItemLabelNode = selectedItemNode.get_node("ItemText/ItemLabel");
    var selectedItemDescriptionNode = selectedItemNode.get_node("ItemText/ItemDescription");

    var large_icon = load(item.icon_image_large);
    var image : Image = large_icon.get_data();
    var image_texture = ImageTexture.new();
    image.resize(large_image_size, large_image_size);
    image_texture.create_from_image(image);
    selectedItemImageNode.texture = image_texture;

    selectedItemLabelNode.text = item.label;
    selectedItemDescriptionNode.text = item.description;
