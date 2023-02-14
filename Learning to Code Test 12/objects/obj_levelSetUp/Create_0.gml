globalvar gemNumber;
gemNumber = 0
globalvar gemsCollected;
gemsCollected = 0
//WORK OUT the length of the level in each direction
xLength = array_length_1d(levelDesign[0])
yLength = array_length_1d(levelDesign)
place = ""
//Repeat over the level in both directions
for (var j=0; j<yLength; j++){
	for (var i=0; i<xLength; i++){
		//Get the string/array at each position
		place = Get(levelDesign, j,i)
		if is_string(place){
			//Call up this script, with what should be placed and at what position
			placeLevelElements(place,i,j);
		}else{
			if is_array(place){
				//Loop over the array thats in that position
				for (var m = 0; m<array_length_1d(place); m++){
					//Call up this script, with what should be placed and at what position
					placeLevelElements(Get(place,m),i,j);
				}
			}
		}
	}
}