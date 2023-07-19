extends CanvasLayer
@onready var player  = $"../TileMap/main_character"
enum  {
	MOVING, READING
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	

func _on_label_release_player():
	visible=false
	player.state = MOVING


func _on_first_prompt_intro_prompt(keys, count):
	player.state=READING
	visible=true


func _on_no_go_intro_wall_prompt(keys, count):
	player.state=READING
	visible=true
	


func _on_food_food_eaten(keys, count):
	player.state=READING
	visible=true


func _on_tile_map_progress_lvl(_keys, _count):
	player.state=READING
	visible=true


func _on_first_prompt_outro_prompt(keys, count):
	player.state=READING
	visible=true



func _on_tile_map_lvl_2_dead(prompts, count):
	player.state=READING
	visible=true


func _on_hitbox_dead(promts, count):
	player.state=READING
	visible=true




func _on_intro_lvl_2_intro(keys, count):
	player.state=READING
	visible=true


func _on_spikes_prompt_spikes(keys, count):
	player.state=READING
	visible=true


func _on_exit_exit(keys, count):
	player.state=READING
	visible=true


func _on_exit_prompt_exit(keys, count):
	player.state=READING
	visible=true


func _on_intro_intro(prompts, count):
	player.state=READING
	visible=true
