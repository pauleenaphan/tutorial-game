extends Area2D

@onready var gamemanager = %Gamemanager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	print("+1 coin")
	gamemanager.add_point() # adds point to the score
	animation_player.play("pickup") # plays the pickup coin 
