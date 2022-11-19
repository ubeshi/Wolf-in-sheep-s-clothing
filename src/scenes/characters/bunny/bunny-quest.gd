extends PlayerQuest

class_name BunnyQuest

func _init():
    self.label = "bunny";
    self.description = "Bunny seems to be missing something. Take a look around to see if you can find it.";
    self.item = Backpack.new();
