extends PlayerQuest

class_name CatQuest

func _init():
    self.label = "cat";
    self.description = "Add Cat Quest.";
    self.item = WineBottle.new();
