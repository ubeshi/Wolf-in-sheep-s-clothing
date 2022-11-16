extends Menu

var pig = Pig.new();

var characters = [pig];

var pig_hints = CulpritHints.pig_hints;

var culprit_menu_body_node_path = "CanvasLayer/CulpritMenu/MarginContainer/ColorRect/MarginContainer/CulpritMenuBody";
onready var culprit_menu_body_node = get_node(culprit_menu_body_node_path);

func _init() -> void:
    CulpritHints.add_pig_hint()
    CulpritHints.add_pig_hint()
    CulpritHints.add_pig_hint()
    self.open_menu_button_path = "CanvasLayer/UI/MarginContainer/ButtonOpenCulpritMenu";
    self.close_menu_button_path = culprit_menu_body_node_path + "/CulpritMenuActions/ButtonCloseCulpritMenu";
    self.menu_path = "CanvasLayer/CulpritMenu";

func handle_menu_opened() -> void:
    set_selected_culprit(characters[0]);

func get_culprit_list(culprits: Array) -> Array:
    var buttons = [];
    for culprit in culprits:
        var button = TextureButton.new();
        var texture = load(culprit.image);
        button.texture_normal = texture;
        button.connect("pressed", self, "set_selected_culprit", [culprit]);
        buttons.append(button);
    return buttons;

func set_selected_culprit(culprit: Culprit) -> void:
    var selectedCulpritNode = culprit_menu_body_node.get_node("SelectedCulprit");
    var selectedItemImageNode = selectedCulpritNode.get_node("CulpritImage");
    var selectedItemLabelNode = selectedCulpritNode.get_node("CulpritText/CulpritLabel");
    var selectedItemDescriptionNode = selectedCulpritNode.get_node("CulpritText/CulpritDescription");
    var arr = [1, 2, 3];
    for i in arr:
        var node_path = "CulpritText/CulpritHint" + str(i);
        var selectedHintNode = selectedCulpritNode.get_node(node_path);
        if pig_hints.size() >= i:
            selectedHintNode.text = pig_hints[i - 1];
        else:
            selectedHintNode.text = "hint not available";

    selectedItemImageNode.texture = load(culprit.image);
    selectedItemLabelNode.text = culprit.label;
    selectedItemDescriptionNode.text = culprit.description;
