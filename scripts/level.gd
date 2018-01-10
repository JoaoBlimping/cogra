extends Node2D

onready var hud = preload("res://objects/hud.tscn")
export var song = ""


func _ready():
	add_child(hud.instance())
	if (song != ""): get_node("/root/musicPlayer").playSong(song)
	