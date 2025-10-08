extends CharacterBody2D
@export var speed := 90.0
@export var max_hp := 4
var hp := max_hp
func _ready():
    add_to_group("monsters")
func _physics_process(delta):
    var player_node = get_tree().get_root().get_node_or_null("Main/Level1/Player") or get_tree().get_root().get_node_or_null("Main/Level/Player")
    if player_node:
        var dir = (player_node.global_position - global_position)
        var dist = dir.length()
        if dist > 8:
            velocity = dir.normalized() * speed
            move_and_collide(velocity * delta)
        if dist < 28:
            player_node.call_deferred("take_damage", 1)
