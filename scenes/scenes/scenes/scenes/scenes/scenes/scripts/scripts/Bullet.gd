extends Area2D


@export var speed: float = 520.0
@export var damage: int = 25
var direction := Vector2.RIGHT
var life := 1.6 # seconds


func _ready():
body_entered.connect(_on_body_entered)


func _process(delta):
position += direction * speed * delta
life -= delta
if life <= 0.0:
queue_free()


func _on_body_entered(body):
if body == null: return
if body.has_method("take_damage"):
body.take_damage(damage)
queue_free()
