extends CharacterBody2D

@export var speed := 220.0
@export var dash_speed := 520.0
@export var dash_time := 0.18
@export var max_hp := 10
var hp := max_hp
var damage := 2
var velocity := Vector2.ZERO
var dash_timer := 0.0
var attack_cooldown := 0.0

func _physics_process(delta):
    var input_vec = Vector2.ZERO
    input_vec.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    input_vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    if input_vec.length() > 0:
        input_vec = input_vec.normalized()
        velocity = input_vec * speed
    else:
        velocity = Vector2.ZERO
    if Input.is_action_just_pressed("dash") and dash_timer <= 0:
        dash_timer = dash_time
        velocity = input_vec * dash_speed
    if dash_timer > 0:
        dash_timer -= delta
    move_and_collide(velocity * delta)

func take_damage(amount):
    hp -= amount
    if hp <= 0:
        queue_free()
