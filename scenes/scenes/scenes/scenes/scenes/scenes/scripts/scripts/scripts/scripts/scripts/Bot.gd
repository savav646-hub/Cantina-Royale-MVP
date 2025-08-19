extends CharacterBody2D
var wander_time := 0.0


func _ready():
add_to_group("players")


func _physics_process(delta):
var player = _find_player()
if player:
var to_player = (player.global_position - global_position)
var dist = to_player.length()
if dist > 40.0:
velocity = to_player.normalized() * speed
else:
velocity = Vector2.ZERO
look_at(player.global_position)


_fire_cooldown -= delta
if _fire_cooldown <= 0.0:
_shoot(player.global_position)
_fire_cooldown = 1.0 / fire_rate
else:
# wander
wander_time -= delta
if wander_time <= 0.0:
wander_dir = Vector2(randf()*2.0-1.0, randf()*2.0-1.0).normalized()
wander_time = randf() * 2.0 + 0.5
velocity = wander_dir * speed * 0.6
rotation += (randf()-0.5) * 0.05
move_and_slide()


func _find_player():
var candidates = get_tree().get_nodes_in_group("players")
for c in candidates:
if c != self and c.is_inside_tree():
if global_position.distance_to(c.global_position) <= vision_range:
return c
return null


func _shoot(target_pos: Vector2):
if bullet_scene == null: return
var b = bullet_scene.instantiate()
b.global_position = global_position + (transform.x * 18.0)
b.direction = (target_pos - global_position).normalized()
get_tree().current_scene.add_child(b)


func take_damage(amount: int):
hp -= amount
if hp <= 0:
queue_free()
get_tree().call_group("game", "on_player_dead")
