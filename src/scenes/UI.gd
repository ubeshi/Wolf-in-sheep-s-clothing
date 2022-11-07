extends CanvasLayer


var camera_data = {
    "front": {
        "translation": Vector3(1.5, 0.5, 0)
    },
    "right": {
        "translation": Vector3(0, 0.5, -1)
    },
    "back": {
        "translation": Vector3(-1, 0.5, 0)
    },
    "left": {
        "translation": Vector3(0, 0.5, 1)
    }
}

var camera_path = ["front", "right", "back", "left"]
var lerp_speed = 0.05
onready var camera = get_node("Camera")
var camera_rotation;

func _ready():
    camera_rotation = camera.rotation;

func set_camera_position(rotation):
    var path
    var position

    var camera_position = camera.get_camera_transform().origin
    for i in camera_data:
        if camera_data[i]["translation"] == camera_position:
            path = camera_path.find(i) + rotation
            if (path > (camera_path.size() - 1)):
                path = 0
            position = camera_data[camera_path[path]]

    camera.transform.origin = position["translation"]
    camera_rotation.y += rotation*PI/2;
    camera_rotation.y = fmod(camera_rotation.y, PI*2); # Restrict location to match real camera rotation limitations 

func _process(delta):
    camera.rotation.y = lerp(camera.rotation.y, camera_rotation.y, lerp_speed);
