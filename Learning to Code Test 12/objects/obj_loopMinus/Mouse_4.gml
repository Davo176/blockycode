/// @description Insert description here
// You can write your code in this editor
linked_num_block = instance_place(x+64,y,obj_loopNumber)
with linked_loop_Block{
	if loopNumber > 1{
		loopNumber -= 1
		with other.linked_num_block{
			image_index -= 1
		}
	}
	with linked_end_Block{
		  loopNumber = other.loopNumber
	}
}