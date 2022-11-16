extends Node

var pig_hints = [];

func add_pig_hint() -> void:
    var number_of_hints = pig_hints.size();
    if number_of_hints < 3:
        var pig = Pig.new();
        pig_hints.append(pig.hints[number_of_hints]);

func get_pig_hints(culprit: Culprit) -> Array:
    return pig_hints;
