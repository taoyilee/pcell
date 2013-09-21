/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strLibName="RFVLSI_N65"
strCellName="ind_nturn"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD	"float"	80.0)  ; Inductor total width
	(W 	"float" 2.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(DIV	"float"	3.0) ; Line spacing
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	(DUMMYL       "string" "RFVLSI")
	(DUMMYLP      "string" "drawing")
	(dummy		"boolean" t)
	(NT_N		"boolean" t)
	(NT		"int" 3)
)
let((master),
	master = dbOpenCellViewByType(pcCellView~>lib "ind_turn" "layout")

	for(i 0 NT-1
        dbCreateParamInst(pcCellView master nil i*(W+S):0 "R0" 1
        list(
            list("W" "float" W)
            list("OD" "float" OD-2*i*(W+S))
            list("S" "float" S)
			list("DIV" "float" DIV)
	    	list("TOP_ME" "string" TOP_ME)
    	   	list("BTM_ME" "string" BTM_ME)
            list("dummy" "boolean" dummy)
        	list("DUMMYL" "string" DUMMYL)
        	list("NT_N" "boolean" NT_N)
	        list("DUMMYLP" "string" DUMMYLP)
            list("OPEN" "float" 0.0))
		)
	)


)/*end of let*/
)/*end of pcDefinePCell*/

