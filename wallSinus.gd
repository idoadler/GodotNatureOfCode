extends StaticBody2D

# Other example, this is a float that defaults to 64.0
export var limits := Vector2(0.3,1.0)
export var angleVel := 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	var col = get_node("CollisionPolygon2D")
	var pol = get_node("Polygon2D")
	var line = get_node("Line2D")
	var vectors: PoolVector2Array
	var size = get_viewport().size
	vectors.append(Vector2(0,2*size.y))
	var angle = 0
	for i in range(size.x):
		var vec = Vector2(i,size.y*lerp(limits.x,limits.y,0.5+0.5*sin(float(angle))))
		angle += angleVel
		line.add_point(vec)
		vectors.append(vec)
	vectors.append(Vector2(size.x,2*size.y))
	col.polygon = vectors
	pol.polygon = vectors
