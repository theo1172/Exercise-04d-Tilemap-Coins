extends TileMap

var coins = []
const BIG_NUMBER = 1000000

func _ready():
	for x in range(1000):
		for y in range(1000):
			if get_cell(x,y) != -1:
				coins.append(Vector2(x,y))

func get_coin(p):
	var coords = world_to_map(to_local(p))
	var min_distance = BIG_NUMBER
	var which_coin = Vector2.ZERO
	for c in coins:
		var d = coords.distance_to(c)
		if d < min_distance:
			min_distance = d
			which_coin = c
	if which_coin != Vector2.ZERO:
		call_deferred("set_cellv", which_coin, -1)
		update_dirty_quadrants()
