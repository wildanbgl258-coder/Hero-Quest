extends CharacterBody2D
@export var speed := 80.0
@export var max_hp := 120
var hp := max_hp
var state := "idle"
var charge_timer := 0.0
func _ready():
    add_to_group("monsters")
    add_to_group("boss")
func _physics_process(delta):
    var player_node = get_tree().get_root().get_node_or_null("Main/Level1/Player") or get_tree().get_root().get_node_or_null("Main/Level/Player")
    if player_node:
        var dir = (player_node.global_position - global_position)
        var dist = dir.length()
        if state == "idle":
            charge_timer += delta
            if charge_timer > 1.2:
                state = "charge"
                charge_timer = 0
        elif state == "charge":
            velocity = dir.normalized() * (speed * 3)
            move_and_collide(velocity * delta)
            state = "idle"
        if hp <= 0:
            queue_free()
            if get_node_or_null("/root/Main"):
                get_node("/root/Main").call_deferred("on_boss_defeated")
