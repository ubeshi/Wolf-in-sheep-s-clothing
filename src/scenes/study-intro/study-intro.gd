extends Spatial

signal camera_movement_complete;
signal finished;

onready var fade_color_rect = get_node("ColorRect");
onready var fade_animation_player = get_node("ColorRect/AnimationPlayer");
onready var camera1 = get_node("Camera1");
onready var camera2 = get_node("Camera2");
onready var camera3 = get_node("Camera3");
onready var camera4 = get_node("Spatial/CameraFocus/Camera4");
onready var camera4_focus = get_node("Spatial/CameraFocus");

var camera_focus_previous_location;
var camera_focus_destination;
var CAMERA_SPEED = 1.0;

onready var cat = get_node("Spatial/Cat");
onready var frog = get_node("Spatial/Frog");
onready var dog = get_node("Spatial/Dog");
onready var bunny = get_node("Spatial/Bunny");
onready var fox = get_node("Spatial/Fox");

enum CAMERA_STATE {
        MOVING,
        ARRIVED,
   }
var current_camera_state = CAMERA_STATE.ARRIVED;

func _ready() -> void:
    yield(zoom_cut(camera1, fade_animation_player), "completed");
    yield(zoom_cut(camera2, fade_animation_player), "completed");
    yield(zoom_cut(camera3, fade_animation_player), "completed");
    camera4.current = true;
    fade_color_rect.hide();
    yield(focus_camera_on_character(camera4_focus, cat), "completed");
    yield(focus_camera_on_character(camera4_focus, frog), "completed");
    yield(focus_camera_on_character(camera4_focus, dog), "completed");
    yield(focus_camera_on_character(camera4_focus, bunny), "completed");
    yield(focus_camera_on_character(camera4_focus, fox), "completed");
    emit_signal("finished");

var lerp_progress = 0.0;
func _physics_process(delta) -> void:
    match current_camera_state:
        CAMERA_STATE.MOVING:
            handle_state_camera_moving(delta, camera_focus_previous_location, camera_focus_destination);
        CAMERA_STATE.ARRIVED:
            emit_signal("camera_movement_complete");

func handle_state_camera_moving(delta: float, source: Transform, destination: Transform) -> void:
    if (source != null && destination != null && lerp_progress < 1.0):
        lerp_progress += delta * CAMERA_SPEED;
        camera4_focus.transform = source.interpolate_with(destination, lerp_progress);

    elif (lerp_progress >= 1.0):
        current_camera_state = CAMERA_STATE.ARRIVED;
        lerp_progress = 0.0;

func zoom_cut(camera: Camera, animation_player: AnimationPlayer) -> GDScriptFunctionState:
    camera.current = true;
    animation_player.play("Fade");
    return yield(animation_player, "animation_finished");

func focus_camera_on_character(camera_focus: Spatial, character_node: Node) -> void:
    var camera_focus_y_offset = Vector3(0, camera_focus.translation.y, 0);
    camera_focus_previous_location = camera_focus.transform;
    camera_focus_destination = get_transform_for_character(character_node) \
        .translated(camera_focus_y_offset);
    current_camera_state = CAMERA_STATE.MOVING;
    var dialog = Dialogic.start(character_node.name.to_lower() + '-intro');
    add_child(dialog);
    yield(get_tree().create_timer(4.0), "timeout");
    yield(self, "camera_movement_complete");

func get_transform_for_character(character_node: Node) -> Transform:
    return character_node.get_transform();

