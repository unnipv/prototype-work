extends Tree

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var is_selected = false

func _ready():
	var root = self.create_item()
	root.set_text(0, 'Arena')

func add_asset(text, asset_id):
	var child = self.create_item(get_root())
	child.set_text(0, text)
	child.set_metadata(0,asset_id)

func asset_select():
	if get_selected() != null:
		var current_object = get_selected().get_metadata(0)
		print(current_object)
		get_tree().call_group("Assets", "set_enabled", current_object)
		is_selected = false

func already_selected(flag):
	is_selected = true

func _on_AssetTree_cell_selected():
	asset_select()
