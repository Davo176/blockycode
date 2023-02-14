//Switch around based off what should be placed: Basically fancy IF statement
switch (argument0){
	case "G":
		//Create the Grass at a depth so that the illusion of 3 Dimensions works
		instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,(-argument1-argument2),obj_greenTile);
		break;
	case "R":
		//Create the Robot and set it's position
		instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,-200,obj_Robot1);
		RobotPosition = [argument1,argument2];
		break;
	//Create the flag's and Gem's at any position
	case "F":
		show_debug_message(string(argument1)+ "        "+string(argument2))
		instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,-100,obj_Flag);
		break;
	case "Gem":
		instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,-100,obj_Gem);
		gemNumber += 1
		break;
	case "BP":
		with instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,-100,obj_Portal){;
			sprite_index = bluePortal
		}
		break;
	case "RP":
		with instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,-100,obj_Portal){;
			sprite_index = redPortal
		}
		break;
	case "YP":
		with instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,-100,obj_Portal){;
			sprite_index = yellowPortal
		}
		break;
	case "GP":
		with instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,-100,obj_Portal){;
			sprite_index = greenPortal
		}
		break;
	case "PP":
		with instance_create_depth(argument1*64+32+64*4,argument2*64+32+64,-100,obj_Portal){;
			sprite_index = purplePortal
		}
		break;
}