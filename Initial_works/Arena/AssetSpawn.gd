extends Control


func _on_Fence_pressed():
	print("pressed")
	var asset = load("res://Assets/fence.tscn").instance()
	var asset_node = get_node("../../Assets")
	asset_node.add_child(asset)
#	asset.set_as_toplevel(true)
	asset.translation = Vector3(0,0,0)
	
func _on_Cart_pressed():
	print("pressed")
	var asset = load("res://Assets/cartHigh.tscn").instance()
	var asset_node = get_node("../../Assets")
	asset_node.add_child(asset)
#	asset.set_as_toplevel(true)
	asset.translation = Vector3(0,0,0)


func _on_Hedge_pressed():
	print("pressed")
	var asset = load("res://Assets/hedge.tscn").instance()
	var asset_node = get_node("../../Assets")
	asset_node.add_child(asset)
#	asset.set_as_toplevel(true)
	asset.translation = Vector3(0,0,0)
