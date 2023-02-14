switch argument0{
	//IF the step is move
	case "obj_Move":
	//based off which direction its facing
		switch image_index{
			//IF it's facing right
			case 0:
				//Get the contents of the block to the right
				nextPos = Get(levelDesign,RobotPosition[1],RobotPosition[0]+1)
				//IF it;s a string and not a "X"
				if is_string(nextPos){
					if nextPos != "X"{
						//Move the robot foward and update the array storing the robots position
						x+=64;
						RobotPosition[0]+=1
					}
				//Same thing if it's an array, but have to go a step further
				}else if is_array(nextPos){
					nextPos = Get(levelDesign,RobotPosition[1],RobotPosition[0]+1,0)
					if nextPos != "X"{
						x+=64;
						RobotPosition[0]+=1
					}
				}
				break;
			case 1:
				nextPos = Get(levelDesign,RobotPosition[1]-1,RobotPosition[0])
				if is_string(nextPos){
					if nextPos != "X"{
						y-=64;
						RobotPosition[1]-=1
					}
				}else if is_array(nextPos){
					nextPos = Get(levelDesign,RobotPosition[1]-1,RobotPosition[0],0)
					if nextPos != "X"{
						y-=64;
						RobotPosition[1]-=1
					}
				}
				break;
		
			case 2:
				nextPos = Get(levelDesign,RobotPosition[1],RobotPosition[0]-1)
				if is_string(nextPos){
					if nextPos != "X"{
						x-=64;
						RobotPosition[0]-=1
					}
				}else if is_array(nextPos){
					nextPos = Get(levelDesign,RobotPosition[1],RobotPosition[0]-1,0)
					if nextPos != "X"{
						x-=64;
						RobotPosition[0]-=1
					}
				}
				break
			case 3:
				nextPos = Get(levelDesign,RobotPosition[1]+1,RobotPosition[0])
				if is_string(nextPos){
					if nextPos != "X"{
						y+=64;
						RobotPosition[1]+=1
					}
				}else if is_array(nextPos){
					nextPos = Get(levelDesign,RobotPosition[1]+1,RobotPosition[0],0)
					if nextPos != "X"{
						y+=64;
						RobotPosition[1]+=1
					}
				}
				break;
		}
		//BELOW GETS what is at a POSITION
		//Get(levelDesign,Get(RobotPosition[1]),Get(RobotPosition[0]))
		if is_array(Get(levelDesign,Get(RobotPosition[1]),Get(RobotPosition[0]))){
			if Get(levelDesign,Get(RobotPosition[1]),Get(RobotPosition[0]), 1) == "Gem"{
				if instance_place(x,y,obj_Gem){
					gemsCollected+=1
					instance_destroy(instance_place(x,y,obj_Gem))
				}
			}
		}
		break;
	case "obj_Turn_Right":
		if image_index != 0{
			image_index -= 1
		}else{
			image_index = 3
		}
		break;
	case "obj_Turn_Left":
		if image_index != 3{
			image_index += 1
		}else{
			image_index = 0
		}
		break;
	case "obj_Whirl":
		if is_array(Get(levelDesign,Get(RobotPosition[1]),Get(RobotPosition[0]))){
			if string_char_at(Get(levelDesign,Get(RobotPosition[1]),Get(RobotPosition[0]), 1),2) == "P"{
				var position = Get(levelDesign,Get(RobotPosition[1]),Get(RobotPosition[0]), 2)
				x=position[0]*64+32+64*4
				y=position[1]*64+32+64
				RobotPosition[0] = position[0]
				RobotPosition[1] = position[1]
				show_debug_message(string(RobotPosition));
			}
		}
}