extends Node


var alive := 0


func _ready():
add_to_group("game")
_recount()


func _recount():
alive = get_tree().get_nodes_in_group("players").size()


func on_player_dead():
_recount()
if alive <= 1:
get_tree().change_scene_to_file("res://scenes/Victory.tscn")
