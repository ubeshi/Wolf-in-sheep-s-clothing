extends Control

signal finished;

func _ready() -> void:
    var dialog = Dialogic.start("story-scene-one0");
    add_child(dialog);
    dialog.connect("timeline_end", self, "end_story_scene_one");

func end_story_scene_one(_arg) -> void:
    emit_signal("finished");
