extends RigidBody2D


export var limits := Vector2(5.0,25.0)
var radius = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	var col = get_node("CollisionShape2D")
	radius = rand_range(limits.x, limits.y)
	var poly = CircleShape2D.new()
	poly.radius = radius
	col.shape = poly


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()


func _draw():
	draw_circle(Vector2.ZERO,radius,Color.bisque)
