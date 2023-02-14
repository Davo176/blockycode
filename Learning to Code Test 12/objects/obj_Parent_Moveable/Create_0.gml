followMouse = false						//Should this instance follow the mouse
initX = x								//The last x position before moving
initY = y								//The last y position before moving
inZone = false							//Is this instance in the bar
beingDragged = false					//Is this instance being dragged? potentially same as followMouse
doOnceShift = true						//Has this moved once
linked_end_Block = pointer_null			//linked endLoop instance - relevant for errors
linked_middle_block = pointer_null		//Linked midLoop instance