if followMouse == true{						//IF instance should be following mouse
	x = mouse_x								//Go to mouse x position
	y = mouse_y								//Go to mouse x position
	if place_meeting(x, y, obj_DropPos){	//IF its in the bar
		with obj_Dummy{						//Using the dummy object
			if offset mod(64) == 0{			//Considering the offset caused by scrolling
				if !other.inZone{			//IF the block just picked was not just in the zone
											//IF the other block is between the end and start, using multiples of 64
					if (other.y<=((numOfBlocks+1)+offset div(64))*64+32 and other.y div(64)>obj_Start.y div(64)){
											//The Dummy goes to the other pieces y-coord, locked to a multiple of 64
						y = (other.y) div(64)*64+32
					}
				}else{						//IF the block just picked was not just in the zone
					if (other.y<=((numOfBlocks)+offset div(64))*64+32 and other.y div(64)>obj_Start.y div(64)){
											//The Dummy goes to the other pieces y-coord, locked to a multiple of 64
						y = (other.y) div(64)*64+32
					}
				}
			}
			else{							//IF the offset is 32
				if !other.inZone{			//Following is repeated but slightly different
					if (other.y<=((numOfBlocks+1)*64+offset+64) and other.y div(64)>obj_Start.y div(64)){
						y = (other.y+32) div(64)*64
					}
				}else{
					if (other.y<=((numOfBlocks)+offset div(64))*64+32 and other.y div(64)>obj_Start.y div(64)){
						y = (other.y) div(64)*64+32
					}
				}
			}
		}
	}
}
