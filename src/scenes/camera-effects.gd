extends Spatial

onready var animation_player = get_node("ColorRect/AnimationPlayer");

func fade_to_black() -> void:
    animation_player.play("FadeToBlack");
    return yield(animation_player, "animation_finished");

func fade_from_black() -> void:
    animation_player.play("FadeFromBlack");
    return yield(animation_player, "animation_finished");
