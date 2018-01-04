tool
extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(NodePath) var target_node = null

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	solve()

func solve():
	var target = get_node(target_node).global_transform
	global_transform = global_transform.looking_at(target.origin, Vector3(0,1,0))
