extends Culprit

class_name Fox

func _init():
    self.image_small = "res://assets/culprits/fox/fox.png";
    self.image_large = "res://assets/culprits/fox/fox_large.png";
    self.label = "Fox";
    self.description = "Friends with Slippy.";
    self.hints = [
        "Was with Dog in the living room. Dog left to get some fresh air and Fox stayed.",
        "Knows you are innocent. Saw you coming out of the washroom before entering the study.",
        "Study room window was opened. This is unusual. Did the killer leave through the small window?",
    ];
