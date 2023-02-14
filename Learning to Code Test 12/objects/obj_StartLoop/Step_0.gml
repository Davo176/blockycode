/// @description Insert description here
// You can write your code in this editor
if followMouse == true{
	x = mouse_x
	y = mouse_y
	if linked_end_Block != pointer_null{
		with linked_end_Block{
			x=other.x
			y=other.y+64
		}
	}
	if place_meeting(x, y, obj_DropPos){
		with obj_Dummy{
			 //IF your block is before end block but not at start - to if before end block and after start.
			if offset mod(64) == 0{
				if (other.y<=((numOfBlocks+1)+offset div(64))*64+32 and other.y div(64)>obj_Start.y div(64)){
					y = (other.y) div(64)*64+32
				}
			}
			else{ //still not working
				if (other.y<=((numOfBlocks+1)*64+offset+64) and other.y div(64)>obj_Start.y div(64)){
					y = (other.y+32) div(64)*64
				}
			}
		}
	}
}
