extends Area2D



@onready var timer = $Timer

func _on_body_entered(body):
	print("user has died")
	Engine.time_scale = 0.5 #go at half speed 
	body.get_node("CollisionShape2D").queue_free(); #queue_free removes the node 
	timer.start() #starts the death timer


func _on_timer_timeout():
	Engine.time_scale = 1 #sets speed back to normal
	get_tree().reload_current_scene() #after the timer ends we restart the game
