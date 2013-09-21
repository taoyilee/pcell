/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_balun_pri"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 150.0)  ; Inductor total width
	(WI	"float" 4.0)	
	(WO	"float" 4.0)	
	(M8_S	"float" 3.0)	
	(S	"float"	2.0) 
	(B_TK	"float"	0.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(A_TK	"float"	0.0) 
	(DIV	"float"	3.414) 
	(ROP "float"	10.0) 
	(LOP "float"	10.0) 
	(dummy "boolean"	t) 
	(NT_N "boolean"	nil) 
	(text "string"	"xfm") 
	(DUMMYL "string" "RFVLSI") 

)
let((P pi C A B BA BB master inst polyg param PI PO),
	master = dbOpenCellViewByType(pcCellView~>lib "base_balun_halfud" "layout" );
	PI = WI + S
	PO = WO + S
	param = list(
            list("W"      "float" WO)
            list("S"      "float" S)
            list("B_TK"   "float" B_TK)
            list("LEADDYI"   "float" LEADDYI)
            list("LEADDYO"   "float" LEADDYO)
            list("A_TK"   "float" A_TK)
            list("DIV"    "float" DIV)
            list("LOP" "float" LOP+S+M8_S)
            list("ROP" "float" ROP)
            list("DUMMYL" "string"  DUMMYL)
        )
	dbCreateRect(pcCellView, MetalVec(7), list(OD-2*PO-WI:ROP+LEADDYO OD:WO+ROP+LEADDYO))
	dbCreateRect(pcCellView, MetalVec(7), list(OD-2*PO-WI:-ROP+LEADDYO OD:-WO-ROP+LEADDYO))

	dbCreateRect(pcCellView, MetalVec(8), list(0:-LOP-M8_S-S WO:LOP+M8_S+S))
	dbCreateRect(pcCellView, MetalVec(8), list(PO+PI:-LOP-M8_S-S PO+PI+WO:LOP+M8_S+S))

	dbCreateRect(pcCellView, MetalVec(8), list(WO:-WO/2 PO+PI:WO/2))

	dbCreateParamInst(pcCellView master nil 0:0 "R0" 1 
		cons(list("OD"     "float" OD) 
		cons(list("align_left"     "boolean" t) 
		cons(list("dummy"     "boolean" t) 
		param))))

	dbCreateParamInst(pcCellView master nil WO+WI+2*S:0 "R0" 1 
		cons(list("OD"     "float" OD-2*(PI+PO)) 
		cons(list("align_left"     "boolean" nil) 
		cons(list("dummy"     "boolean" nil) 
		param))))


)/*end of let*/
)/*end of pcDefinePCell*/
