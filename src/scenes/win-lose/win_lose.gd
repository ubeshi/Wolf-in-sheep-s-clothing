extends Spatial

var win = WinLossFlag.get_flag();

func _ready() -> void:
    if (win):
        get_node("Control/Win").visible = true;
    else:
        get_node("Control/Lose").visible = true;
