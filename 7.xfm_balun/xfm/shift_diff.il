strLibName = "RFVLSI_N65"
strCellName = "shift_diff"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 15.0)
	(LineW  "float" 2.0)
	(S1 "float" 10.0)
	(S2 "float" 5.0)
	(TOP_ME "int" 8)
	(BTM_ME "int" 8)
)

let((master_vias  Width param inst2 rectOutline),
	master_vias=dbOpenCellViewByType(pcCellView~>lib "xfm_cross" "layout")
	param =  list(
                        list("WO"        "float" LineW)
                        list("WI"     	 "float" S2)
                        list("S"     	 "float" 0.0)
                        list("viat"    "boolean" nil)
                        list("viad"    "boolean" nil)
                        list("dummy"    "boolean" nil)
                        list("TOP_ME"   "int" TOP_ME)
                        list("BTM_ME"   "int" BTM_ME)
                )
	dbCreateParamInst(pcCellView master_vias  nil 0:0 "R0" 1   param)
	inst2 = dbCreateParamInst(pcCellView master_vias  nil S1:0 "R0" 1  param)
	rectOutline = rodGetObj(inst2)
                
        rodAssignHandleToParameter(
                ?parameter "S1"
                ?rodObj rectOutline
                ?displayName "S1"
                ?displayExpression "S1"
                ?handleName list("lowerLeft")
                ?stretchType "absolute"
                ?moveOrigin nil
                ?stretchDir "x" 
                ?userFunction "std_CB"
        )   

	rodAssignHandleToParameter(
                ?parameter "Length"
                ?rodObj rectOutline
                ?displayName "Length"
                ?displayExpression "Length"
                ?handleName list("upperLeft")
                ?stretchType "absolute"
                ?moveOrigin nil 
                ?stretchDir "y" 
                ?userFunction "std_CB"
        )   


)/*end of let*/
)/*end of pcDefinePCell*/

                                                              
