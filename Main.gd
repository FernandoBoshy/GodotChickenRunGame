extends Node

const NOVOCARRO = preload("res://carros.tscn")

var pista_devagar_cima = [322, 266, 154, 98]
var pista_rapida_cima = 210
var pista_devagar_baixo = [606, 550, 438, 382]
var pista_rapida_baixo = 494

var placar_1 = 0
var placar_2 = 0

func _ready():
	$Button.hide()
	$tema.play()
	randomize()
	

func _on_tempocarrorapido_timeout():
	var num_random = rand_range(0,100)
	if num_random > 49:
		var carrorapido = NOVOCARRO.instance()
		add_child(carrorapido)
		carrorapido.position.x = -10
		carrorapido.position.y = pista_rapida_cima
		carrorapido.linear_velocity = Vector2(700, 0)

func _on_tempocarrodevagar_timeout():
	var carrodevagar = NOVOCARRO.instance()
	add_child(carrodevagar)
	carrodevagar.position.x = -10
	carrodevagar.position.y = pista_devagar_cima[randi() % pista_devagar_cima.size()]
	carrodevagar.linear_velocity = Vector2(300, 0)

func _on_tempocarrorapido2_timeout():
	var num_random = rand_range(0,100)
	if num_random > 49:
		var carrorapido = NOVOCARRO.instance()
		add_child(carrorapido)
		carrorapido.position.x = 1290
		carrorapido.position.y = pista_rapida_baixo
		carrorapido.linear_velocity = Vector2(-700, 0)

func _on_tempocarrodevagar2_timeout():
	var carrodevagar = NOVOCARRO.instance()
	add_child(carrodevagar)
	carrodevagar.position.x = 1290
	carrodevagar.position.y = pista_devagar_baixo[randi() % pista_devagar_baixo.size()]
	carrodevagar.linear_velocity = Vector2(-300, 0)
	
	
func _on_Player1_pontua():
	if placar_1 < 5:
		placar_1 += 1
		$ponto.play()
		$placar1.text = str(placar_1)
	if placar_1 >= 5:
		$Button.show()
		$tema.stop()
		$resultado.text = "PLAYER 1 VENCEU"
		$ganhou.play()
		$tempocarrorapido.stop()
		$tempocarrodevagar.stop()
		$tempocarrorapido2.stop()
		$tempocarrodevagar2.stop()

func _on_Player2_pontua2():
	if placar_2 < 5:
		placar_2 += 1
		$ponto.play()
		$placar2.text = str(placar_2)
	if placar_2 >= 5:
		$Button.show()
		$tema.stop()
		$resultado.text = "PLAYER 2 VENCEU"
		$ganhou.play()
		$tempocarrorapido.stop()
		$tempocarrodevagar.stop()
		$tempocarrorapido2.stop()
		$tempocarrodevagar2.stop()



func _on_Button_pressed():
	$Button.hide()
	placar_1 = 0
	placar_2 = 0
	$placar1.text = "0"
	$placar2.text = "0"
	$resultado.text = ""
	$tempocarrodevagar.start()
	$tempocarrorapido.start()
	$tempocarrodevagar2.start()
	$tempocarrorapido2.start()
	$Player1.voltar()
	$Player2.voltar()
	$tema.play()

