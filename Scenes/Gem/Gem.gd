extends Area2D

signal gem_off_screen




const SPEED:float = 80

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += delta * SPEED
	
	if position.y > get_viewport_rect().end.y:
		gem_off_screen.emit()
		die()


func _on_area_entered(area: Area2D) -> void:
	die()

func die() -> void:
	set_process(false)
	queue_free()
