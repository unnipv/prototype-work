extends Control

onready var parent_node = get_node("../../Assets")

func _on_Fence_pressed():
	print("pressed")
	var asset = load("res://Assets/fence.tscn").instance()
	var asset_node = parent_node
	asset_node.add_child(asset)
	asset.global_transform.origin = asset.get_global_transform().origin.linear_interpolate(Vector3(0,0,0), 1)
	var asset_tree = get_node("../../AssetTree")
	asset_tree.add_asset("Fence",asset)
	
func _on_Cart_pressed():
	print("pressed")
	var asset = load("res://Assets/cartHigh.tscn").instance()
	var asset_node = parent_node
	asset_node.add_child(asset)
	asset.global_transform.origin = asset.get_global_transform().origin.linear_interpolate(Vector3(0,0,0), 1)
	var asset_tree = get_node("../../AssetTree")
	asset_tree.add_asset("Cart", asset)
	
func _on_Hedge_pressed():
	print("pressed")
	var asset = load("res://Assets/hedge.tscn").instance()
	var asset_node = parent_node
	asset_node.add_child(asset)
	asset.global_transform.origin = asset.get_global_transform().origin.linear_interpolate(Vector3(0,0,0), 1)
	var asset_tree = get_node("../../AssetTree")
	asset_tree.add_asset("Hedge", asset)

func set_parent(node):
	parent_node = node
	
