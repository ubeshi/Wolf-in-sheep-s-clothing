extends Culprit

class_name Dog

func _init():
    self.image_small = "res://assets/culprits/dog/dog.png";
    self.image_large = "res://assets/culprits/dog/dog.png";
    self.label = "Dog";
    self.description = "Likes to dig holes and eat from bowls.";
    self.hints = [
        "Dog was with Fox, then went outside, then stayed in the basement with Cat and Frog.",
        "Saw Bunny leaving the kitchen to the living room. Looked like Bunny was carrying a heavy bag.",
        "Found something suspicious in the garden. How did it get there?",
    ];
