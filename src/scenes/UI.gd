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


func set_camera_position(rotation):
    var path
    var position
    var camera = get_node("Camera")
    var camera_position = camera.get_camera_transform().origin

    for i in camera_data:
        if camera_data[i]["translation"] == camera_position:
            print('Before: ' + i)
            path = camera_path.find(i) + rotation
            if (path > (camera_path.size() - 1)):
                path = 0
            print('After: ' + camera_path[path])
            position = camera_data[camera_path[path]]

    camera.transform.origin = position["translation"]
    camera.rotate_y(rotation*PI/2)
