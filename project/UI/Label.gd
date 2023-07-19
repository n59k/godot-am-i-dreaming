extends Label

var file_data = {}
var displayed_chars = 0
var time_left = 0.05
var entered = false
var prompt_count
var btn_pressed
var keys

signal release_player

# Called when the node enters the scene tree for the first time.
func _ready():
	load_JSON()


# Called every frame. 'delta' is the elapsed time since the previous frame.


func load_JSON():
	if not FileAccess.file_exists("res://UI/texts/texts.json"):
		return
	var file = FileAccess.open("res://UI/texts/texts.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file_data = data

func _physics_process(delta):
	if entered:
		if (time_left>0 and entered):
			time_left-=delta
		else :
			roll_text()
			time_left=0.05
	if visible_characters==(text.length()): 
		entered=false
	
func roll_text():
	if (text.length() > displayed_chars):
		displayed_chars += 1
		visible_characters=displayed_chars


func _on_button_pressed():
	if btn_pressed<prompt_count:
		visible_characters=0
		displayed_chars = 0
		text=file_data.get(keys[btn_pressed])
		btn_pressed +=1
		entered = true
	else:
		release_player.emit()
		entered=false
	
	
func prepare_text(prompts, count):
	keys=prompts
	prompt_count=count
	btn_pressed = 1
	visible_characters=0
	displayed_chars = 0
	text=file_data.get(prompts[0])
	entered=true


func _on_first_prompt_intro_prompt(prompts, count):
	prepare_text(prompts, count)
	

func _on_no_go_intro_wall_prompt(prompts, count):
	prepare_text(prompts, count)


func _on_food_food_eaten(prompts, count):
	prepare_text(prompts, count)


func _on_tile_map_progress_lvl(prompts, count):
	prepare_text(prompts, count)


func _on_first_prompt_outro_prompt(prompts, count):
	prepare_text(prompts, count)


func _on_tile_map_lvl_2_dead(prompts, count):
	prepare_text(prompts, count)


func _on_hitbox_dead(promts, count):
	prepare_text(promts, count)


func _on_intro_lvl_2_intro(prompts, count):
	prepare_text(prompts, count)


func _on_spikes_prompt_spikes(prompts, count):
	prepare_text(prompts, count)


func _on_exit_exit(prompts, count):
	prepare_text(prompts, count)


func _on_exit_prompt_exit(keys, count):
	prepare_text(keys, count)


func _on_intro_intro(prompts, count):
	prepare_text(prompts, count)


func _on_chest_key_found(prompts, count):
	prepare_text(prompts, count)


func _on_information_info(prompts, count):
	prepare_text(prompts, count)


func _on_finall_finall(prompts, count):
	prepare_text(prompts, count)
