extends Area2D

func _ready():
	connect("body_enter",self,"enter")
	connect("body_exit",self,"exit")

func enter(body):
	if (body.is_in_group("dudes")): body.wet = true

func exit(body):
	if (body.is_in_group("dudes")): body.wet = false