extends Node2D


@export var start_radius: float = 480.0
@export var end_radius: float = 80.0
@export var shrink_time: float = 120.0 # seconds until min
@export var dmg_per_sec_outside: int = 10


var t := 0.0
var current_r := 0.0


func _ready():
current_r = start_radius
set_process(true)


func _process(delta):
t = min(t + delta, shrink_time)
current_r = lerp(start_radius, end_radius, t / shrink_time)
update()


# damage players outside
for p in get_tree().get_nodes_in_group("players"):
if p and p.is_inside_tree():
var dist = p.global_position.distance_to(global_position)
if dist > current_r and p.has_method("take_damage"):
p.take_damage(int(dmg_per_sec_outside * delta))


func _draw():
draw_circle(Vector2.ZERO, current_r, Color(1,0,0,0.1))
draw_arc(Vector2.ZERO, current_r, 0.0, TAU, 64, Color(1,0,0,0.7), 3.0)
