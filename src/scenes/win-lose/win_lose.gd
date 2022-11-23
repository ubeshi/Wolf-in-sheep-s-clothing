extends Spatial

var win = false;

func _ready() -> void:
    if (win == true):
        get_node("Control/Win").visible = true;
    else:
        get_node("Control/Lose").visible = true;
