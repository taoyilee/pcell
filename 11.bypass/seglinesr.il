strLibName= "RFVLSI_N65"
strCellName = "seglinesr"

pcDefinePCell(list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 30.0)
	(SegLength  "float" 10.0)
	(Width "float"   2.5)
	(cols   "int"   2)
	(cols_sp   "float"   3.0)
	(TOP_ME   "int" 7)
	(BTM_ME   "int" 6)
)
let((master rows LengthRmdr rodpath1),

	rows =  floor(Length/SegLength)
	LengthRmdr = Length - rows*SegLength

	master=dbOpenCellViewByType(pcCellView~>lib "segline" "layout")

	if(rows > 0
	then ;Length > SegLength
	        dbCreateParamSimpleMosaic(pcCellView master  "M0"  0:0 "R0" 
		rows cols SegLength cols_sp+Width
                list(
                        list("Length"     "float"    SegLength)   ; Line width
                        list("Width"     "float"     Width)   ; Line width
                        list("BTM_ME"  "int"    BTM_ME) ; Turns
                        list("TOP_ME"   "int"   TOP_ME) ; Turns
                ))
	)

		rodpath1 = rodCreatePath(
                ?name "rodpath1"
                ?layer MetalVec(TOP_ME-1)
                ?pts list(0:0 0:Length)
                ?width Width
                ?cvId pcCellView
        ) ; end rodCreatePath

        rodAssignHandleToParameter(
	        ?parameter "Length"
	        ?rodObj rodpath1
	        ?displayName "Length"
	        ?displayExpression "Length"
	        ?handleName list("lowerCenter" "upperCenter")
	        ?stretchType "relative"
	        ?moveOrigin t 
        	?stretchDir "y"
	        ?userFunction "std_CB"
        )

	if(LengthRmdr > 0
	then
	dbCreateParamSimpleMosaic(pcCellView master  "M1"  0:rows*SegLength "R0" 1 cols SegLength cols_sp + Width

                list(
                        list("Length"     "float"    LengthRmdr)   ; Line width
                        list("Width"     "float"     Width)   ; Line width
                        list("BTM_ME"  "int"    BTM_ME) ; Turns
                        list("TOP_ME"   "int"   TOP_ME) ; Turns
                ))
	)
)/*end of let*/
)/*end of pcDefinePCell*/
