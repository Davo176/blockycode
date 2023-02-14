/// @description Insert description here
// You can write your code in this editor
if collision_rectangle(x-10,y-40,x+10,y,obj_console,false,false){
	consoleAt = collision_rectangle(x-10,y-40,x+10,y,obj_console,false,true)
	nearestGate = instance_nearest(x,y,obj_Fence)
	with consoleAt{
		levelDesign = myLevel
		allowedBlocks = LevelAllowedBlocks
	}
	room_goto(3)
}