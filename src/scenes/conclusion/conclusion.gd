extends Control

signal finished;

func _ready() -> void:
    var dialog = Dialogic.start("conclusion0");
    add_child(dialog);
    dialog.connect("timeline_end", self, "end_conclusion");

func end_conclusion(_arg) -> void:
    var culprit_choice = Dialogic.get_variable("CulpritChoice");
    if (culprit_choice == "Bunny"):
        WinLossFlag.set_flag(true);
    emit_signal("finished");
