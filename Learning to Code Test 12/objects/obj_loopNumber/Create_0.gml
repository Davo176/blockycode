/// @description Insert description here
// You can write your code in this editor
image_speed = 0
linked_loop_Block = instance_place(x-128,y,obj_StartLoop)
with linked_loop_Block{
	other.image_index = loopNumber-1
}