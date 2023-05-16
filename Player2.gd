extends Area2D

export var speed = 100
var screen_size
signal pontua2

	
func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)

func _process(delta):
	var velocity = Vector2(0, 0)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y += -1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity*delta
	position.y = clamp(position.y, 0, screen_size.y)
	if velocity.y > 0:
		$AnimatedSprite.animation = "Baixo"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "Cima"


func _on_Player2_body_entered(body):
	if body.name == "ganha":
		emit_signal("pontua2")
	else:
		$AudioStreamPlayer2D.play()
	voltar()
func voltar():
	position.x = 944
	position.y = 696
