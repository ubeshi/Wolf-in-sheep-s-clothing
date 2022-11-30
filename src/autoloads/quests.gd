extends Node

const quest_list = [];
const total_quests = 5;
var completed_quests = 0;

func add_quest(quest: PlayerQuest) -> void:
    if quest_list.has(quest) == false:
        quest_list.append(quest);

func remove_quest(remove: PlayerQuest) -> void:
    for quest in quest_list:
        if quest.label == remove.label:
            quest_list.erase(quest);
            completed_quests += 1;
            completed_quests = min(completed_quests, 5);
            next_quest(remove);

func next_quest(quest: PlayerQuest) -> void:
    if quest.has_method("second_quest"):
        quest.second_quest();
