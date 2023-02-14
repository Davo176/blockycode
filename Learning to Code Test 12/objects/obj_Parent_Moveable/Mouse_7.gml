if beingDragged{
	followMouse = false
	if !place_meeting(x,y, obj_DropPos){
		
		if inZone{
			numOfBlocks -= 1
		}
		instance_destroy()	
		inZone = false
		with obj_Dummy{
			y= numOfBlocks*64+96+offset
		}
	}else{
		with obj_loopBlocks{
			instance_destroy()
		}
		if !inZone{
			numOfBlocks += 1
		}
		with obj_Dummy{
			other.x = x
			other.y = y
			y= numOfBlocks*64+96+offset
		}
		with obj_Parent_Moveable{
			if y>=other.y and place_meeting(x,y,obj_DropPos) and id!=other.id{
				y+=64
			}
		}
		inZone = true
		beingDragged = false
		id.layer = layer_get_id("Placed_Block")
		with obj_StartLoop{
			if linked_end_Block != pointer_null{
				if other.y > y and other.y < linked_end_Block.y and other.linked_middle_block == pointer_null{
					other.linked_middle_block = instance_create_layer(other.x,other.y,"midLoop", obj_MidLoop)
				}
			}
		}
	}
}
DRAGGED = false
with obj_Parent_Moveable{
	doOnceShift = true
}
