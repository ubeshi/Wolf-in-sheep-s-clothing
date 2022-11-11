extends Node

var is_in_dialogue: bool = false setget set_is_in_dialogue, get_is_in_dialogue;
var is_in_menu: bool = false setget set_is_in_menu, get_is_in_menu;

func is_in_interaction() -> bool:
    return is_in_dialogue || is_in_menu;

func set_is_in_dialogue(value: bool) -> void:
    is_in_dialogue = value;

func get_is_in_dialogue() -> bool:
    return is_in_dialogue;

func set_is_in_menu(value: bool) -> void:
    is_in_menu = value;

func get_is_in_menu() -> bool:
    return is_in_menu;
