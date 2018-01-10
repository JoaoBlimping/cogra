extends Sprite

func _ready():
	var pos = get_pos()
	var scale = get_scale()
	set_region(true)
	#set_offset(pos)
	set_region_rect(Rect2(pos,get_texture().get_size() * scale))
	set_scale(Vector2(1,1))
	get_node("static").set_scale(scale)
