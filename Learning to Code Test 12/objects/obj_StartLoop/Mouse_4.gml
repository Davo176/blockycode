/// @description Insert description here
// You can write your code in this editor
if DRAGGED == false{
	followMouse = true
	DRAGGED = true
}
if followMouse{
	with obj_Parent_Moveable{
		if y > other.y and x = other.x{
			if other.linked_end_Block!= pointer_null{
				with other.linked_end_Block{
					if y > other.y{
						if other.linked_middle_block != pointer_null{
							with other.linked_middle_block{
								instance_destroy()
							}
						other.linked_middle_block=pointer_null
						}
					}
				}
			}
		}
	}
}



if !place_meeting(x,y, obj_DropPos) and linked_end_Block == pointer_null{
	linked_end_Block = instance_create_layer(x,y+64,"Moving_Block",obj_EndLoop);
	with linked_end_Block{
		linked_end_Block = other.id //CURRENTLY USING linked end block, should probably make a new variable
	}
}

initX = x
initY = y
with linked_end_Block{
	initX = x
	initY = y
}
if !inZone{
	instance_create_layer(x,y,"Moving_Block", object_index)
}else{
	id.layer = layer_get_id("Moving_Block")
	
}
beingDragged = true
if place_meeting(x,y,obj_DropPos){
	with obj_loopBlocks{
			instance_destroy()
	}
	with obj_Parent_Moveable{
		if place_meeting(x,y,obj_DropPos){
			if y>other.initY and doOnceShift == true{
				y-=64 //ADD SOMETHING IN FOR 64/128
				doOnceShift = false
				with other.linked_end_Block{
					if other.y>=initY{
						other.y-=64
					}
				}
			}
		}
	}
}
