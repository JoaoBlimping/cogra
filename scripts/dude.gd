extends KinematicBody2D

var velocity = Vector2()
var GRAVITY = 666
const FPS = 0.1
var grounded = false
var wet = false
onready var sprite = get_node("sprite")
var frames = 1
var t = FPS
var frame = 0
var dangerous = true

func _ready():
	set_process(true)
	frames = sprite.get_hframes() * sprite.get_vframes()
	set_collision_mask(1)
	set_layer_mask(3)
	add_to_group("dudes")

func _process(delta):
	# movement stuff
	if (velocity.x > 0): set_scale(Vector2(1,1))
	if (velocity.x < 0): set_scale(Vector2(-1,1))
	velocity.y += GRAVITY * delta
	var fail = move(velocity * delta)
	if (fail.length() > 0): collision(get_collider())
	move(piece(fail,0))
	if (move(piece(fail,1)).y > 0):
		grounded = true
		velocity.y = 0
	else: grounded = false
	
	if (wet && velocity.y > 0): grounded = true
	
	# animation stuff
	t -= delta
	if (t < 0):
		t = FPS
		frame += 1
		if (frame == frames): frame = 0
		sprite.set_frame(frame)
	
	if (get_pos().y > 0): fallen()

func collision(other):
	if (other.get_name() == "cogra"):
		if (other.dangerous): fallen()
		else: other.fallen()

func fallen():
	queue_free()

func piece(v,i):
	if (i == 0): return Vector2(v[i],0)
	else: return Vector2(0,v[i])