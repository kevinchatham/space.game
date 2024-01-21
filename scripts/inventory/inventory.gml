function search_inventory(_root_object,_item_type){
	for(var _i=0; _i < obj_ship_inventory.inventory_slots; _i++){
		if(_root_object.inventory[_i] == _item_type){
			return (_i)
		}
	}
	return -1;
}

function remove_inventory(_root_object,_item_type){
	var _slot = search_inventory(_root_object,_item_type);
	if(_slot != -1){
		with(_root_object){
			inventory[_slot] = -1;
		} 
		return true;
	}
	else return false;
}


function add_inventory(_root_object,_item_type){
	var _slot = search_inventory(_root_object,_item_type);
	if(_slot != -1){
		with(_root_object){
			inventory[_slot] = _item_type;
		} 
		return true;
	}
	else return false;
}




