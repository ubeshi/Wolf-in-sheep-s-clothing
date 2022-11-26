extends Menu

var bunny = Bunny.new();
var cat = Cat.new();
var dog = Dog.new();
var fox = Fox.new();
var frog = Frog.new();

var bunny_hints = CulpritHints.bunny_hints;
var cat_hints = CulpritHints.cat_hints;
var dog_hints = CulpritHints.dog_hints;
var fox_hints = CulpritHints.fox_hints;
var frog_hints = CulpritHints.frog_hints;

var characters = [bunny, cat, dog, fox, frog];

var culprit_menu_body_node_path = "CanvasLayer/CulpritMenu/MarginContainer/ColorRect/MarginContainer/CulpritMenuBody";
onready var culprit_menu_body_node = get_node(culprit_menu_body_node_path);

func _init() -> void:
    self.open_menu_button_path = "CanvasLayer/UI/MarginContainer/ButtonOpenCulpritMenu";
    self.close_menu_button_path = culprit_menu_body_node_path + "/CulpritMenuActions/ButtonCloseCulpritMenu";
    self.menu_path = "CanvasLayer/CulpritMenu";

func handle_menu_opened() -> void:
    emit_signal("opened_menu", "culprit_menu");
    var culprit_list_node = culprit_menu_body_node.get_node("CulpritList");
    var buttons = get_culprit_list_buttons(characters);
    for button in buttons:
        culprit_list_node.add_child(button);
    set_selected_culprit(characters[0]);

func handle_menu_closed() -> void:
    emit_signal("closed_menu", "culprit_menu");
    var culprit_list_node = culprit_menu_body_node.get_node("CulpritList");
    for culprit in culprit_list_node.get_children():
        culprit_list_node.remove_child(culprit);
        culprit.queue_free();

func get_culprit_list_buttons(culprits: Array) -> Array:
    var buttons = [];
    for culprit in culprits:
        var button = TextureButton.new();
        var texture = load(culprit.image_small);
        button.texture_normal = texture;
        button.connect("pressed", self, "set_selected_culprit", [culprit]);
        buttons.append(button);
    return buttons;

func set_selected_culprit(culprit: Culprit) -> void:
    var selectedCulpritNode = culprit_menu_body_node.get_node("SelectedCulprit");
    var selectedItemImageNode = selectedCulpritNode.get_node("CulpritImage");
    var selectedItemLabelNode = selectedCulpritNode.get_node("CulpritText/CulpritLabel");
    var selectedItemDescriptionNode = selectedCulpritNode.get_node("CulpritText/CulpritDescription");
    var culprit_hints = [];
    match culprit:
        bunny:
            culprit_hints = bunny_hints;
        cat:
            culprit_hints = cat_hints;
        dog:
            culprit_hints = dog_hints;
        fox:
            culprit_hints = fox_hints;
        frog:
            culprit_hints = frog_hints;

    var arr = [1, 2, 3];
    for i in arr:
        var node_path = "CulpritText/CulpritHint" + str(i);
        var selectedHintNode = selectedCulpritNode.get_node(node_path);
        if culprit_hints.size() >= i:
            selectedHintNode.text = culprit_hints[i - 1];
        else:
            selectedHintNode.text = "hint not available";

    selectedItemImageNode.texture = load(culprit.image_large);
    selectedItemLabelNode.text = culprit.label;
    selectedItemDescriptionNode.text = culprit.description;
