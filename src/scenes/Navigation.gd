extends Control

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


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(4.0), "timeout")
	_on_RightButton_pressed()
	yield(get_tree().create_timer(1.0), "timeout")
	_on_RightButton_pressed()
	yield(get_tree().create_timer(1.0), "timeout")
	_on_RightButton_pressed()
	yield(get_tree().create_timer(1.0), "timeout")
	_on_LeftButton_pressed()
	yield(get_tree().create_timer(1.0), "timeout")
	_on_LeftButton_pressed()
	yield(get_tree().create_timer(1.0), "timeout")
	_on_LeftButton_pressed()
	yield(get_tree().create_timer(1.0), "timeout")
	_on_LeftButton_pressed()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_camera_position(rotation):
	var path
	var position
	var camera = get_parent().get_parent().get_node("Camera")
	var camera_position = camera.get_camera_transform().origin
	
	for i in camera_data:
		if camera_data[i]["translation"] == camera_position:
			print(i)
			path = camera_path.find(i) + rotation
			if (path > (camera_path.size() - 1)):
				path = 0
			print(camera_path[path])
			position = camera_data[camera_path[path]]
			
	camera.transform.origin = position["translation"]
	camera.rotate_y(rotation*PI/2)

func _on_LeftButton_pressed():
	set_camera_position(-1)

func _on_RightButton_pressed():
	set_camera_position(1)
