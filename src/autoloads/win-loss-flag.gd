extends Node

var flag;

func set_flag(option: bool) -> void:
    if (option):
        flag = true;
    else:
        flag = false;

func get_flag() -> bool:
    if (typeof(flag) == TYPE_BOOL):
        return flag;
    else:
        # fallback
        return false;
