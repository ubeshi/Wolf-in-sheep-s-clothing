extends Culprit

class_name Bunny

func _init():
    self.image_small = "res://assets/culprits/bunny/bunny.png";
    self.image_large = "res://assets/culprits/bunny/bunny_large.png";
    self.label = "Bunny";
    self.description = "Otherwise known as Boingo. Likes to make carrot cakes and puddings.";
    self.hints = [
        "Says it was in the kitchen during the murder.",
        "Seems to have lost its bag, where it stored the sharp cooking knife...?",
        "Something seems off about Bunny's bag.",
    ];
