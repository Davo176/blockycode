/// @description Insert description here
// You can write your code in this editor
effect_create_above(ef_snow, 0, 0, 1, c_white);
if !irandom(4)
   {
   effect_create_above(ef_cloud, random(room_width), random(room_height), choose(0, 1, 2), c_white);
   }