//IF the number of actions done is less than the length
//of the array consisting of all the actions
if (action < array_length_1d(operations)){
	//Call up the script, sending in the name of the action
	doAction(operations[action])
	//If its not the last action
	if action != array_length_1d(operations)-1{
		//call up this event again, to do the next action in 20 frames
		alarm[0] = 20
	}
}
//add one to the action count
action+=1
//check if the level is completed
levelCompleted = false
if levelCompleteCheck(){
	levelCompleted = true
}

//if it is the last object
if action == array_length_1d(operations){
	action = 0
	//if the levels completed, open the nearest gate and go home
	if levelCompleted{
		openGate = true
		alarm[1] = 20
	}else{
		//otherwise reset the level
		alarm[2] = 20
	}
}