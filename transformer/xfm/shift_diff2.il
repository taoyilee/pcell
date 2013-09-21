strLibName = "RFVLSI_N65"
strCellName = "shift_diff2"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 15.0)
	(Length2  "float" 15.0)
	(LineW  "float" 2.0)
	(S1 "float" 10.0)
	(S2 "float" 5.0)
	(TOP_ME "int" 8)
	(BTM_ME "int" 8)
)

let((master_vias  master_vias2 inst param),
	master_vias = dbOpenCellViewByType(pcCellView~>lib "shift_diff" "layout")
	master_vias2 =dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	param =  list(
                        list("Length"        "float" Length)
                        list("LineW"        "float" LineW)
                        list("S1"        "float" S1)
                        list("S2"        "float" S2)
                        list("TOP_ME"   "int" TOP_ME)
                        list("BTM_ME"   "int" BTM_ME)
                )
	inst = dbCreateParamInst(pcCellView master_vias  nil 0:Length2 "R0" 1   param)
	dbCreateParamInst(pcCellView master_vias  nil 0:-Length2 "MX" 1  param)

	param_v =  list(
                        list("Length"        "float" 2*Length2-4*LineW)
                        list("Width"        "float" LineW)
                        list("TOP_ME"   "int" TOP_ME)
                        list("BTM_ME"   "int" BTM_ME)
                )
	dbCreateParamInst(pcCellView master_vias2  nil 0:-Length2+2*LineW "R0" 1  param_v)
	dbCreateParamInst(pcCellView master_vias2  nil S1:-Length2+2*LineW "R0" 1  param_v)

	rectOutline = rodGetObj(inst)
	rodAssignHandleToParameter(
                ?parameter "Length2"
                ?rodObj rectOutline
                ?displayName "Length2"
                ?displayExpression "Length2"
                ?handleName list("lowerCenter")
                ?stretchType "absolute"
                ?moveOrigin nil 
                ?stretchDir "y" 
                ?userFunction "std_CB"
        )   


)/*end of let*/
)/*end of pcDefinePCell*/

                                                              
