extends Node2D


var fade = preload("res://scene_assets/Fade.tscn")


func load_scene(new_scene):
	
	var scene = load(Globals.scenes[new_scene]).instance()
	
	var player = load("res://entities/player/Player.tscn").instance()
	
	add_child(fade.instance())
	
	$Fade/AnimationPlayer.play("Fade")
	yield($Fade/AnimationPlayer, "animation_finished")
	
	self.get_child(0).queue_free()
	
	self.add_child(scene)
	
	scene.add_child(player)
	
	player.global_position = Globals.pos[new_scene]
	
	$Fade/AnimationPlayer.play_backwards("Fade")
	yield($Fade/AnimationPlayer, "animation_finished")
	
	$Fade.queue_free()


func init():
	
	self.load_scene("MainRoom")


func _ready():
	
	self.call_deferred("init")
