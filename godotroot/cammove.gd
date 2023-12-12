extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	var playerpos = $"/root/Node2D/char".position
	var pgrid = Vector2(round(playerpos.x / 810) * 810, round(playerpos.y / 1080) * 1080) + Vector2(0, 0)
	set_position(position.lerp(pgrid, 0.2))
	pass
