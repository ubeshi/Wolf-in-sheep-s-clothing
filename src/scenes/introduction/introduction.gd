extends Spatial

signal finished;

onready var ubeshi = get_node("Ubeshi");

func _ready() -> void:
    ubeshi.get_node("AnimationPlayer").get_animation("ArmatureAction").set_loop(true);

func _on_AnimationPlayer_animation_finished(_animation_name):
    emit_signal("finished");
