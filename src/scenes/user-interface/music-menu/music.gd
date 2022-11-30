extends Node

var audio;

func _ready():
    audio = get_node("AudioStreamPlayer");

func toggle_audio(state) -> void:
    if state:
        audio.play();
    else:
        audio.stop();
