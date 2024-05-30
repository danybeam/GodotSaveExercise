extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_save_button_pressed():
	var save_game_gd = FileAccess.open("user://savegame_gd.save", FileAccess.WRITE)

	var save_dict = {}
	
	var save_nodes = get_tree().get_nodes_in_group("Save")
	for node in save_nodes:
#		print(node.name)
#		print("\n")
#		print(node.text)
		save_dict[node.name] = node.text
		for n in 1000:
			save_dict[str(node.name, n)] = node.text
	
		

	var json_string = JSON.stringify(save_dict)
	save_game_gd.store_line(json_string)
	save_game_gd.close()


func _on_load_pressed():
	if not FileAccess.file_exists("user://savegame_gd.save"):
		return # Error! We don't have a save to load.
	var save_game_gd = FileAccess.open("user://savegame_gd.save", FileAccess.READ)
	var json_string = save_game_gd.get_line()
	# Creates the helper class to interact with JSON
	var json = JSON.new()

	# Check if there is any error while parsing the JSON string, skip in case of failure
	var parse_result_code = json.parse(json_string)
	var parse_result = json.get_data()
	var save_nodes = get_tree().get_nodes_in_group("Save")
	
	for node in save_nodes:
		#node.text = parse_result[node.name]
		pass
	
	#print(parse_result)
	#print(save_nodes)


func _on_save_button_pressed_binary():
	var save_game_bin = FileAccess.open("user://savegame_bin.save", FileAccess.WRITE)

	var save_nodes = get_tree().get_nodes_in_group("Save")
	for node in save_nodes:
		print(node.name)
		print(node.text)
		save_game_bin.store_string(node.name)
		save_game_bin.store_string(node.text)
		for n in 1000:
			save_game_bin.store_string(str(node.name, n))
			save_game_bin.store_string(node.text)
	
	save_game_bin.close()


func _on_load_pressed_binary():
	if not FileAccess.file_exists("user://savegame_bin.save"):
		return # Error! We don't have a save to load.
	var save_game_bin = FileAccess.open("user://savegame_bin.save", FileAccess.READ)
	#var buffer = FileAccess.get_file_as_bytes("user://savegame_bin.save")
	
	while not save_game_bin.eof_reached():
		var test = save_game_bin.get_position()
		var nodeName = save_game_bin.get_as_text()
		var node = find_child(nodeName)
		
	
	#print(save_nodes)
