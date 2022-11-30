extends PlayerQuest

class_name FoxQuest

func _init():
    self.label = "Fox's Quest";
    self.description = "Fox is hungry for some of Bunny's Carrot Cake. Grab him a slice.";
    self.item = Cake.new();
