extends Control
func _ready():
    # Simple auto-remove splash after 2.2s (replace with animation in editor)
    await get_tree().create_timer(2.2).timeout
    queue_free()
