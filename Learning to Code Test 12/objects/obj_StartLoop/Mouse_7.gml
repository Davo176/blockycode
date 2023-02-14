/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// NEXT ADD IN DIFFERENT BLOCKS TO SEE HOW ORDER CHANGES
if beingDragged{
	followMouse = false
	if !place_meeting(x,y, obj_DropPos){
		if inZone{
			numOfBlocks -= 2
		}
		instance_destroy()
		with linked_end_Block{
			instance_destroy()
		}
		inZone = false
		with obj_Dummy{
			y= numOfBlocks*64+96+offset
		}
	}else{
		if !inZone{
			numOfBlocks += 2
		}
		with obj_loopBlocks{
			instance_destroy()
		}
		with obj_Dummy{
			other.x = x
			other.y = y
			y= numOfBlocks*64+96+offset
		}
		
		with obj_Parent_Moveable{
			if y>=other.y and place_meeting(x,y,obj_DropPos) and id!=other.id and id != other.linked_end_Block{
				y+=128
			}
			if id=other.linked_end_Block{
				with other.linked_end_Block{
					inZone = true
					x=obj_Dummy.x
					y=linked_end_Block.y+64 //This is the line which stuffs up
				}
			}
		}
		inZone = true
	beingDragged = false
	id.layer = layer_get_id("Placed_Block")
	linked_end_Block.layer = layer_get_id("Placed_Block")
}
}
DRAGGED = false
with obj_Parent_Moveable{
	doOnceShift = true
}
