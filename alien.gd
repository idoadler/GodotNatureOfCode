extends RigidBody2D


export var limits := Vector2(3.0,16.0)
var radius = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	# add circle
	var node = CollisionShape2D.new()
	add_child(node)
	radius = rand_range(limits.x, limits.y)
	var cir = CircleShape2D.new()
	cir.radius = radius
	node.shape = cir
	
	# add polygon
	var x = 0
	var y = 0
	var flipY = true
	var flipX = true
	var vectors: PoolVector2Array
	vectors.append(Vector2(x,y))
	while(vectors.size() < 3 or flipY or flipX or randf() < 0.5):
		x += rand_range(2,20) if flipX else rand_range(-10,-1)
		if randf() < 0.5:
			flipX = false
		y += rand_range(2,20) if flipY else rand_range(-10,-1)
		if randf() < 0.5:
			flipY = false
		vectors.append(Vector2(x,y))
	var col = get_node("CollisionPolygon2D")
	var pol = get_node("Polygon2D")
	print(vectors)
	col.polygon = vectors
	pol.polygon = vectors



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()


func _draw():
	draw_circle(Vector2.ZERO,radius,Color.bisque)
