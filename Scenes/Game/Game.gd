extends Node2D

@onready var paddle: Area2D = $Paddle
@onready var spawn_timer: Timer = $Timer

const GEM = preload("res://Scenes/Gem/Gem.tscn")
const MARGIN = 20


func _ready() -> void:
	spawn_gem()
	
func stop_all() -> void:
	spawn_timer.stop()
	
	for child in get_children():
		if child is Gem:
			child.set_process(false)
	paddle.set_process(false)
	
	
func spawn_gem() -> void:
	var new_gen : Gem = GEM.instantiate()
	var x_pos: float = randf_range(get_viewport_rect().position.x + MARGIN, get_viewport_rect().size.x-MARGIN)

	new_gen.position = Vector2(x_pos, -50.0)
	new_gen.gem_off_screen.connect(_on_gem_off_screen)
	add_child(new_gen)
	
	
	
func _on_paddle_area_entered(area: Area2D) -> void:
	print("COLLISION PADDLE")
	
	
func _on_gem_off_screen() -> void:
	stop_all()


func _on_timer_timeout() -> void:
	spawn_gem()
