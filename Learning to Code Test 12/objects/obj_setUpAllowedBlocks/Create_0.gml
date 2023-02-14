/// @description Insert description here
// You can write your code in this editor
for (var m=0; m<array_length_1d(allowedBlocks); m++){
	instance_create_layer(128+m*96,704,"Placed_Block", allowedBlocks[m])
}