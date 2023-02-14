//TODO
//SHOW MESSAGE THEN WAIT TIL THEY HIT A BUTTON



//remove all minigame Objects
with obj_Parent_MiniGame{
	instance_destroy()
}
//replace them all
gemNumber = 0
gemsCollected = 0
xLength = array_length_1d(levelDesign[0])
yLength = array_length_1d(levelDesign)
place = ""
for (var j=0; j<yLength; j++){
	for (var i=0; i<xLength; i++){
		place = Get(levelDesign, j,i)
		if is_string(place){
			placeLevelElements(place,i,j);
		}else{
			if is_array(place){
				for (var m = 0; m<array_length_1d(place); m++){
					placeLevelElements(Get(place,m),i,j);
				}
			}
		}
	}
}
//remove all blocks of code