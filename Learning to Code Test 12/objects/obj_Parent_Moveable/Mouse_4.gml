if DRAGGED == false{		//If no other blocks are being drageged
	followMouse = true		//This block should follow the mouse
	DRAGGED = true			//Now a block is being dragged
}

initX = x					//Set the initial x and y coordinates
initY = y

if !inZone{					//if the block wasnt just in the bar
	instance_create_layer(x,y,"Moving_Block", object_index)	//create a new instance to be moved on the moving block layer
}else{						//if it was just in the bar
	id.layer = layer_get_id("Moving_Block")
}

with obj_Dummy{
	if other.inZone{
		y-=64
	}
}

if linked_middle_block != pointer_null and followMouse{
	with linked_middle_block{
		instance_destroy()
	}
	linked_middle_block=pointer_null
}

beingDragged = true
if place_meeting(x,y,obj_DropPos){
	with obj_loopBlocks{
		instance_destroy()
	}
	with obj_Parent_Moveable{
		if place_meeting(x,y,obj_DropPos){
			if y>other.initY and doOnceShift == true{
				y-=64
				doOnceShift = false
			}
		}
	}
}