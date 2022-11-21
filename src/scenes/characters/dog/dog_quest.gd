extends PlayerQuest

class_name DogQuest

func _init():
    self.label = "dog";
    self.description = "Dog misplaced his Top Hat in the Living Room. Help him find it.";
    self.item = TopHat.new();

func KnifeQuest():
    self.description = "Dog smelled something strange in the Garden. Take a look around.";
    self.item = BloodyKnife.new();
