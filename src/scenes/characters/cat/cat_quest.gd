extends PlayerQuest

class_name CatQuest

func _init():
    self.label = "Cat & Frog's Quest";
    self.description = "Horse promised Cat & Frog some of his homegrown wine before he was murdered. Find the bottle and they'll tell you a secret.";
    self.item = WineBottle.new();
