/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_highk_ud"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)  ; Inductor total width
	(WO	"float" 4.0)	
	(WI	"float" 4.0)	
	(W_INC	"float" 1.5)	
	(S	"float"	5.0) 
	(LOP "float" 10.0) 
	(ROP "float"	 10.0) 
	(LOP_M8 "float" 10.0) 
	(ROP_M8 "float"	 10.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(align_left "boolean"	t) 
	(bCons "boolean"	nil) 
)
let((m_base_highk),
	m_base_highk = dbOpenCellViewByType(pcCellView~>lib "base_highk" "layout" )
	dbCreateParamInst(pcCellView m_base_highk nil 0:0 "R0" 1 
		list(
      		list("OD"     "float" OD)
        	list("W"      "float" WO)    
        	list("W_INC"      "float" W_INC)    
        	list("S"      "float" S) 
			list("align_left" "boolean" align_left)
			list("ROP" "float" ROP+LEADDYO)
			list("LOP" "float" LOP+LEADDYI)
			list("ROP_M8" "float" ROP_M8-LEADDYO)
			list("LOP_M8" "float" LOP_M8-LEADDYI)
			list("bCons" "boolean" bCons))
		)
	dbCreateParamInst(pcCellView m_base_highk nil 0:0 "MX" 1 
		list(
      		list("OD"     "float" OD)
        	list("W"      "float" WO)    
        	list("W_INC"      "float" W_INC)    
        	list("S"      "float" S) 
			list("align_left" "boolean" align_left)
			list("ROP" "float" ROP-LEADDYO)
			list("LOP" "float" LOP-LEADDYI)
			list("ROP_M8" "float" ROP_M8-LEADDYO)
			list("LOP_M8" "float" LOP_M8-LEADDYI)
			list("bCons" "boolean" bCons))
	)
)/*end of let*/
)/*end of pcDefinePCell*/

