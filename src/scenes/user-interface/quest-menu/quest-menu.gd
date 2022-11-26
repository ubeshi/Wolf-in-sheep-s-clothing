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
    var total_quests = str(Quests.total_quests);
    var completed_quests = str(Quests.completed_quests);
    var quest_status_node = get_node(quest_menu_body_node_path + "/QuestStatus/QuestStatusLabel");
    if quest_list.size() > 0:
        set_selected_quest(quest_list[0]);
    else:
        set_selected_quest(empty_quest);

    var quest_list_node = quest_menu_body_node.get_node("QuestList");
    var buttons = get_quest_list_buttons(quest_list);
    for button in buttons:
        quest_list_node.add_child(button);
    if (completed_quests != total_quests):
        quest_status_node.text = completed_quests + " / " + total_quests + " Quests Completed";
    else:
        quest_status_node.text = "All Quests Completed"

func handle_menu_closed() -> void:
    var quest_list_node = quest_menu_body_node.get_node("QuestList");
    for quest in quest_list_node.get_children():
        quest_list_node.remove_child(quest);
        quest.queue_free();

func get_quest_list_buttons(quests: Array) -> Array:
    var buttons = [];
    for quest in quests:
        var button = Button.new();
        button.text = quest.label;
        button.connect("pressed", self, "set_selected_quest", [quest]);
        buttons.append(button);
    return buttons;

func set_selected_quest(quest: PlayerQuest) -> void:
    var selectedQuestNode = quest_menu_body_node.get_node("SelectedQuest");
    var selectedQuestLabelNode = selectedQuestNode.get_node("QuestText/QuestLabel");
    var selectedQuestDescriptionNode = selectedQuestNode.get_node("QuestText/QuestDescription");
    selectedQuestLabelNode.text = quest.label;
    selectedQuestDescriptionNode.text = quest.description;
