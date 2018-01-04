extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		apply_impulse(Vector3(),  get_node("../Camera").global_transform.xform(Vector3(0,0,10)))