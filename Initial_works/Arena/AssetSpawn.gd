extends Control


func _on_Fence_pressed():
	print("pressed")
	var asset = load("res://Assets/fence.tscn").instance()
#	var script = load("res://Assets/Asset.gd")
	var asset_node = get_node("../../Assets")
	asset_node.add_child(asset)
#	var mesh_instance = load("res://Assets/fence.tscn").instance()
#	mesh_instance.set_script(script)
#	asset.add_child(mesh_instance)
#	asset.set_as_toplevel(true)
	asset.translation = Vector3(0,0,0)
	var asset_tree = get_node("../../AssetTree")
	asset_tree.add_asset("Fence",asset)
	
func _on_Cart_pressed():
	print("pressed")
	var asset = load("res://Assets/cartHigh.tscn").instance()
	var asset_node = get_node("../../Assets")
	asset_node.add_child(asset)
#	var mesh_instance = load("res://Assets/cartHigh.tscn").instance()
#	asset.add_child(mesh_instance)
#	asset.set_as_toplevel(true)
	asset.translation = Vector3(0,0,0)
	var asset_tree = get_node("../../AssetTree")
	asset_tree.add_asset("Cart", asset)
	
func _on_Hedge_pressed():
	print("pressed")
	var asset = load("res://Assets/hedge.tscn").instance()
	var asset_node = get_node("../../Assets")
	asset_node.add_child(asset)
#	asset.set_as_toplevel(true)
	asset.translation = Vector3(0,0,0)
	var asset_tree = get_node("../../AssetTree")
	asset_tree.add_asset("Hedge", asset)
