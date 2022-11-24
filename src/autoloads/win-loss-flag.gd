extends Node

var WIN = true;
var LOSS = false;
var flag;

func set_flag(option: bool) -> void:
    if (option):
        flag = WIN;
    else:
        flag = LOSS;

func get_flag() -> bool:
    if (typeof(flag) == TYPE_BOOL):
        return flag;
    else:
        # fallback
        return LOSS;
