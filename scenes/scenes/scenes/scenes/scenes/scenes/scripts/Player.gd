extends CharacterBody2D


@export var speed: float = 220.0
@export var fire_rate: float = 6.0 # bullets per second
@export var bullet_scene: PackedScene
var _fire_cooldown := 0.0
var hp := 100


func _ready():
add_to_group("players")


func _physics_process(delta):
var dir := Vector2(
Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
).normalized()
velocity = dir * speed
move_and_slide()


look_at(get_global_mouse_position())


_fire_cooldown -= delta
if Input.is_action_pressed("shoot") and _fire_cooldown <= 0.0:
_shoot()
_fire_cooldown = 1.0 / fire_rate


func _shoot():
if bullet_scene == null: return
var b = bullet_scene.instantiate()
b.global_position = global_position + (transform.x * 18.0)
b.direction = (get_global_mouse_position() - global_position).normalized()
get_tree().current_scene.add_child(b)


func take_damage(amount: int):
hp -= amount
if hp <= 0:
queue_free()
get_tree().call_group("game", "on_player_dead")
