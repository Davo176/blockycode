if !disabled{
	arrayLength = 0
	operations = []
	with obj_Parent_Block{
		if x==32{
			y = y - real(offset)
		}
	}
	offset = 0

	startY = y
	for (var j=1; j<=(numOfBlocks); j+=1){
		currentBlock = instance_position(32,32+j*64,obj_Parent_Moveable)
		currentBlockName = object_get_name(currentBlock.object_index)
		if currentBlockName != "obj_StartLoop" and currentBlockName != "obj_EndLoop"{
			arrayLength+=1*multiplier
		}
		if currentBlockName == "obj_StartLoop"{
			with currentBlock{
				other.multiplier *= loopNumber
			}
		}
		if currentBlockName == "obj_EndLoop"{
			with currentBlock{
				other.multiplier = other.multiplier div(loopNumber)
			}
		}
	}

	var i;
	i=arrayLength-1
	repeat(arrayLength){
		operations[i]=0
		i-=1
	}

	currentBlock = ""
	currentYPos = offset+64+startY
	for (var j=1; j<=(arrayLength); j+=1){
		currentBlock = instance_position(32,currentYPos,obj_Parent_Moveable)
		currentBlockName = object_get_name(currentBlock.object_index)
		while (currentBlockName == "obj_StartLoop" or currentBlockName == "obj_EndLoop"){
			if currentBlockName == "obj_StartLoop"{
				with currentBlock{
					currentLoop = loopNumber
				}
				currentYPos+=64
			}
			if currentBlockName == "obj_EndLoop"{
				with currentBlock{
					if linked_end_Block.currentLoop >1{
						other.currentYPos = linked_end_Block.y+64
						with linked_end_Block{
							currentLoop -=1
						}
					}else{
						other.currentYPos+=64
					}
				}
			}
			currentBlock = instance_position(32,currentYPos,obj_Parent_Moveable)
			currentBlockName = object_get_name(currentBlock.object_index)
		}
		operations[j-1] = currentBlockName
		currentYPos +=64
	}
	with obj_Robot1{
		alarm[0] = 1
	}
}