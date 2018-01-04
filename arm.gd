extends Spatial

export(NodePath) var shoulder_node = null
export(NodePath) var elbow_node = null
export(NodePath) var bicep_node = null
export(NodePath) var forearm_node = null
export(NodePath) var hand_node = null

func _ready():
	set_process(true)

func _process(delta):
	if shoulder_node != null and bicep_node != null:
		var shoulder_t  = get_node(shoulder_node).global_transform
		var elbow_t  = get_node(bicep_node).global_transform
		var bicep_t = Transform(Basis(), shoulder_t.origin)
		bicep_t = bicep_t.looking_at(elbow_t.origin, Vector3(0,1,0))
		var a = bicep_t.basis[2]
		bicep_t.basis[2] = bicep_t.basis[1]
		bicep_t.basis[1] = -a
		$Skeleton.set_bone_global_pose(0, bicep_t)
	if elbow_node != null and forearm_node != null:
		var elbow_t  = get_node(forearm_node).global_transform
		var wrist_t  = get_node(hand_node).global_transform
		var forearm_t = Transform(Basis(), elbow_t.origin)
		forearm_t = forearm_t.looking_at(wrist_t.origin, Vector3(0,1,0))
		var a = forearm_t.basis[2]
		forearm_t.basis[2] = forearm_t.basis[1]
		forearm_t.basis[1] = -a
		$Skeleton.set_bone_global_pose(1, forearm_t)
	if hand_node != null:
		var wrist_t  = get_node(hand_node).global_transform
		var tip_t  = get_node(hand_node).get_node("tip").global_transform
		var hand_t = Transform(Basis(), wrist_t.origin)
		hand_t = hand_t.looking_at(tip_t.origin, Vector3(0,1,0))
		var a = hand_t.basis[2]
		hand_t.basis[2] = hand_t.basis[1]
		hand_t.basis[1] = -a
		$Skeleton.set_bone_global_pose(2, hand_t)