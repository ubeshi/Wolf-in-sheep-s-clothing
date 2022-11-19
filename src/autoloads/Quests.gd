extends Node

const quest_list = [];

func add_quest(quest: PlayerQuest) -> void:
    if quest_list.has(quest) == false:
        quest_list.append(quest);
        print('new quest')

func remove_quest(remove: PlayerQuest) -> void:
    for quest in quest_list:
        if quest.label == remove.label:
            quest_list.erase(quest);
            print('removed quest')
        if remove.label == DogQuest.new().label:
            remove.KnifeQuest();

