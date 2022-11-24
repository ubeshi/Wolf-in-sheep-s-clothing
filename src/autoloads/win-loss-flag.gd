extends Node

enum FlagCondition {
    LOSS,
    WIN
   }

var flag;

func set_flag(option: bool) -> void:
    if (option):
        flag = FlagCondition.WIN;
    else:
        flag = FlagCondition.LOSS;

func get_flag() -> int:
    if (typeof(flag) == TYPE_INT):
        return flag;
    else:
        # fallback
        return FlagCondition.LOSS;
