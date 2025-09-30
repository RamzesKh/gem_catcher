extends Node2D



const GEM = preload("res://Scenes/Gem/Gem.tscn")

func _ready() -> void:
	spawn_gem()
	

func spawn_gem() -> void:
	var new_gen = GEM.instantiate()
	var x_pos: float = randf_range(0.0, get_viewport_rect().size.x-10)
	new_gen.position = Vector2(x_pos, -50.0)
	add_child(new_gen)
	
	
	
func _on_paddle_area_entered(area: Area2D) -> void:
	print("COLLISION PADDLE")
	
	
func _on_gem_off_screen() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	spawn_gem()
