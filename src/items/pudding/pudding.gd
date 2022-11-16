extends PlayerItem

class_name Pudding

func _init():
    self.icon_image_large = "res://assets/items/pudding/pudding-large.png";
    self.icon_image_small = "res://assets/items/pudding/pudding-small.png";
    self.label = "Pudding";
    self.description = "A sweet, milk-based dessert similar in consistency to " \
        + "egg-based custards, instant custards, or a mousse, often commercially " \
        + "set using cornstarch, gelatin or similar coagulating agent.";
    self.quest_id = 1;
