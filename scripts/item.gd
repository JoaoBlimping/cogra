extends Area2D

func _ready():
	connect("body_enter",self,"hit")

func hit(body):
	if (body.get_name() == "cogra"):
		power()
		queue_free()

func power():
	pass