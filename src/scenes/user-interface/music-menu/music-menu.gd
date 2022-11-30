extends Node

var music_toggle_button;
var audio_stream; 

signal toggle_audio;

func _ready():
    self.music_toggle_button = get_node("CanvasLayer/UI/MarginContainer/MusicToggleButton");

func _on_MusicToggleButton_pressed():
    emit_signal("toggle_audio", self.music_toggle_button.pressed);
        
