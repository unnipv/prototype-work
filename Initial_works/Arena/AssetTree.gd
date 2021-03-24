extends Tree


var is_selected = false

func _ready():
	var root = self.create_item()
	root.set_text(0, 'Arena')

func add_asset(text, asset_id):
	var child = self.create_item(get_selected())
	child.set_text(0, text)
	child.set_metadata(0,asset_id)

func asset_select():
	if get_selected() != null:
		var current_object = get_selected().get_metadata(0)
		print(current_object)
		get_tree().call_group("Assets", "set_enabled", current_object)
		var spawner = get_node("../AssetBrowser/Control")
		var asset_root = get_node("../Assets")
		if current_object!= null:
			spawner.set_parent(current_object)
		else:
			spawner.set_parent(asset_root)
		is_selected = false

func already_selected(flag):
	is_selected = true

func _on_AssetTree_cell_selected():
	asset_select()
