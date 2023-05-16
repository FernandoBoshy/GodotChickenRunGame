extends RigidBody2D


func _ready():
	var corcarro = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = corcarro[randi() % corcarro.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
