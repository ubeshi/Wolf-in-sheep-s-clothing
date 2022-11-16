extends Node

const quest_list = [];
var quest_map = [
    {id = 1, quest = BunnyQuest.new()},
    {id = 2, quest = CatQuest.new()},
    {id = 3, quest = DogQuest.new()},
    {id = 4, quest = FoxQuest.new()}
];

func add_quest(quest: PlayerQuest) -> void:
    quest_list.append(quest);

func remove_quest(remove: PlayerQuest) -> void:
    for quest in quest_list:
        if quest.label == remove.label:
            quest_list.erase(quest);
