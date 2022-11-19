extends Node

var pig_hints = [];
var bunny_hints = [];
var cat_hints = [];
var dog_hints = [];
var fox_hints = [];
var frog_hints = [];

var pig = Pig.new();
var bunny = Bunny.new();
var cat = Cat.new();
var dog = Dog.new();
var fox = Fox.new();
var frog = Frog.new();

# Pig
func add_pig_hint() -> void:
    var number_of_hints = pig_hints.size();
    if number_of_hints < 3:
        pig_hints.append(pig.hints[number_of_hints]);

# Bunny
func add_bunny_hint() -> void:
    var number_of_hints = bunny_hints.size();
    if number_of_hints < 3:
        bunny_hints.append(bunny.hints[number_of_hints]);

# Cat
func add_cat_hint() -> void:
    var number_of_hints = cat_hints.size();
    if number_of_hints < 3:
        cat_hints.append(cat.hints[number_of_hints]);

# Dog
func add_dog_hint() -> void:
    var number_of_hints = dog_hints.size();
    if number_of_hints < 3:
        dog_hints.append(dog.hints[number_of_hints]);

# Fox
func add_fox_hint() -> void:
    var number_of_hints = fox_hints.size();
    if number_of_hints < 3:
        fox_hints.append(fox.hints[number_of_hints]);

# Frog
func add_frog_hint() -> void:
    var number_of_hints = frog_hints.size();
    if number_of_hints < 3:
        frog_hints.append(frog.hints[number_of_hints]);
