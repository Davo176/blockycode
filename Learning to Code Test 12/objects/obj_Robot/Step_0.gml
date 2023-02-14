/// @description Insert description here
// You can write your code in this editor
keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
keyActivate = keyboard_check(vk_space);
//Set up variables for moving robot
with obj_player{
	if keyLeft or keyRight or keyUp or keyDown{
		if downTime<52{
			downTime += 1
		}
	}
}
inputDirection = point_direction(x,y,obj_player.x,obj_player.y);
inputMagnitude=0

if place_meeting(x,y,obj_player){
	obj_player.downTime=1
	inputMagnitude = 0
}else{
	inputMagnitude = 1
}

//inputMagnitude = (keyRight - keyLeft)!=0 or (keyDown-keyUp)!=0;
hSpeed = lengthdir_x(inputMagnitude*speedWalk, inputDirection)
vSpeed = lengthdir_y(inputMagnitude*speedWalk, inputDirection)

if obj_player.downTime>=50{
	if tilemap_get_at_pixel(tileID,x+hSpeed,y) == midTileID{
		x += hSpeed
	}
	if tilemap_get_at_pixel(tileID,x,y+vSpeed) == midTileID{
		y += vSpeed
	}


//Update Sprite Index

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
}