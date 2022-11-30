extends Culprit

class_name Cat

func _init():
    self.image_small = "res://assets/culprits/cat/cat.png";
    self.image_large = "res://assets/culprits/cat/cat_large.png";
    self.label = "Cat";
    self.description = "A cat sans hat.";
    self.hints = [
        "Was hanging out with Frog during the murder.",
        "Heard someone come down earlier and grab the rope from the haybales.",
        "The killer must have walked through the kitchen.",
    ];
