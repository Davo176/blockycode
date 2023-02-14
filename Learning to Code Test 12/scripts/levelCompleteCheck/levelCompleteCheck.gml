//CHECK AT END
//CHECK NUMBER OF GEMS COLLECTED
//CHECK NUMBER OF BLOCKS USED
if is_array(Get(levelDesign,Get(RobotPosition[1]),Get(RobotPosition[0]))){
	if Get(levelDesign,Get(RobotPosition[1]),Get(RobotPosition[0]), 1) == "F"{
		if gemsCollected == gemNumber{
			return true
		}
	}
}