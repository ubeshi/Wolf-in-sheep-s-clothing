extends Menu
var quest_list = Quests.quest_list;
var empty_quest = EmptyQuest.new();

var quest_menu_body_node_path = "CanvasLayer/QuestMenu/MarginContainer/ColorRect/MarginContainer/QuestMenuBody";
onready var quest_menu_body_node = get_node(quest_menu_body_node_path);

func _init() -> void:
    self.open_menu_button_path = "CanvasLayer/UI/MarginContainer/ButtonOpenQuestMenu";
    self.close_menu_button_path = quest_menu_body_node_path + "/QuestMenuActions/ButtonCloseQuestMenu";
    self.menu_path = "CanvasLayer/QuestMenu";

func handle_menu_opened() -> void:
    if quest_list.size() > 0:
        set_selected_quest(quest_list[0]);
    else:
        set_selected_quest(empty_quest);

    var quest_list_node = quest_menu_body_node.get_node("QuestList");
    var buttons = get_quest_list_buttons(quest_list);
    for button in buttons:
        quest_list_node.add_child(button);

func handle_menu_closed() -> void:
    var quest_list_node = quest_menu_body_node.get_node("QuestList");
    for quest in quest_list_node.get_children():
        quest_list_node.remove_child(quest);
        quest.queue_free();

func get_quest_list_buttons(quests: Array) -> Array:
    var buttons = [];
    for quest in quests:
        var button = Button.new();
        var text = quest.label;
        button.connect("pressed", self, "set_selected_quest", [quest]);
        buttons.append(button);
    return buttons;

func set_selected_quest(quest: PlayerQuest) -> void:
    var selectedQuestNode = quest_menu_body_node.get_node("SelectedQuest");
    var selectedQuestLabelNode = selectedQuestNode.get_node("QuestText/QuestLabel");
    var selectedQuestDescriptionNode = selectedQuestNode.get_node("QuestText/QuestDescription");
    selectedQuestLabelNode.text = quest.label;
    selectedQuestDescriptionNode.text = quest.description;
