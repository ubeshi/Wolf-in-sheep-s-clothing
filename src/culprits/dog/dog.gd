extends Culprit

class_name Dog

func _init():
    self.image_small = "res://assets/culprits/dog/dog.png";
    self.image_large = "res://assets/culprits/dog/dog_large.png";
    self.label = "Dog";
    self.description = "Likes to dig holes and eat from bowls.";
    self.hints = [
        "Hung out with Fox in the living room, went to the garden, and then stayed in the basement with Cat and Frog.",
        "Saw Bunny leaving the kitchen to the living room. Looked like Bunny was carrying a heavy bag.",
        "Found a bloody knife in the garden. Did the killer leave through the window?",
    ];
