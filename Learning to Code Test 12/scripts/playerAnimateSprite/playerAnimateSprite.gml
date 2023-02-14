//Update the Sprite
//Convert input direction to a value between 0 and 3
var _CardinalDirection = round(direction/90);
//work out how many frames are in an animation
var _TotalFrames = sprite_get_number(sprite_index)/4
//change the index
image_index = localFrame+_CardinalDirection*_TotalFrames;

localFrame += sprite_get_speed(sprite_index)/60;
//if you reach the end of an animation, go back to the start
if localFrame >= _TotalFrames{
	animationEnd = true;
	localFrame -= _TotalFrames;
}else{
	animationEnd = false;
}