strLibName= "RFVLSI_N65"
strCellName = "segline"

pcDefinePCell(list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 30.0)
	(Width "float"   2.5)
	(TOP_ME   "int" 7)
	(BTM_ME   "int" 6)
)
let((),
	if(Length>Width
	then
	dbCreateParamInst(pcCellView
		dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
		nil  -Width/2:0 "R0" 1
                list(
                        list("Length"     "float"    Width)   ; Line width
                        list("Width"     "float"     Width)   ; Line width
                        list("BTM_ME"  "int"    BTM_ME) ; Turns
                        list("TOP_ME"   "int"   TOP_ME) ; Turns
                ))
	)
	dbCreatePath(pcCellView MetalVec(TOP_ME-1)  list(0:0 0:Length) Width "truncateExtend")
	dbCreatePath(pcCellView MetalVec(BTM_ME-1)  list(0:0 0:Length) Width "truncateExtend")
)/*end of let*/
)/*end of pcDefinePCell*/
