//Check if any keys are down
keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
keyActivate = keyboard_check(vk_space);

//define the direction and magnitude of movement
inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft)!=0 or (keyDown-keyUp)!=0;
hSpeed = lengthdir_x(inputMagnitude*speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude*speedWalk, inputDirection);
//show_debug_message(string((tilemap_get_at_pixel(tileID,x+hSpeed,y))))
//IF the tile ID at the next position is 5, i.e. not an edge or corner
if tilemap_get_at_pixel(tileID,x+hSpeed,y) == midTileID{
	//show_debug_message("H")
	//And there isnt a fence at the next position
	if place_meeting(x+hSpeed,y,obj_CantWalkThrough){
		with instance_place(x+hSpeed,y,obj_CantWalkThrough){
			//if the fence is opened
			if image_index == 1
				//move the character in the horizontal direction
				other.x += other.hSpeed
		}
	}else{
		x += hSpeed
	}
}
//Repeat with vertical direction
if tilemap_get_at_pixel(tileID,x,y+vSpeed) == midTileID{
	if place_meeting(x,y+vSpeed,obj_CantWalkThrough){
		with instance_place(x,y+vSpeed,obj_CantWalkThrough){
			if image_index ==1
				other.y += other.vSpeed
		}
	}else{
		y += vSpeed
	}
}
//If open gate is true (set when completing a minigame), open the nearest gate
if openGate == true{
	with nearestGate{
		image_index = 1
	}
	openGate = false
}

//Set up variables for the animating function
var _OldSprite = sprite_index;
if inputMagnitude !=0{
	direction = inputDirection;
	sprite_index = SpriteWalk;
}else{
	sprite_index = SpriteIdle;
}
if _OldSprite != sprite_index{
	localFrame = 0;
}

playerAnimateSprite()
