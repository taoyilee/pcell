/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_xfm_halfud"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0) ; Inductor total width
	(W	"float" 4.0)	
	(S	"float"	5.0) 
	(B_TK	"float"	0.0) 
	(A_TK	"float"	0.0) 
	(LOP "float" 5.0) 
	(ROP "float"	 10.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(en_dmy "boolean"	t) 
	(TOP_ME "string"	"9") 
	(BTM_ME "string"	"9") 
	(via_to_next "boolean"	nil) 
	(via_diag "boolean"	nil) 
)
let((mhalf),
	mhalf = dbOpenCellViewByType(pcCellView~>lib "base_xfm_half" "layout" ) 
	dbCreateParamInst(pcCellView mhalf nil 0:0 "R0" 1 
		list(
		list("OD" "float" OD)
		list("W" "float" W) 
		list("S" "float" S) 
		list("B_TK" "float" B_TK) 
		list("A_TK" "float" A_TK) 
		list("TOP_ME" "string" TOP_ME) 
		list("BTM_ME" "string" BTM_ME) 
		list("en_dmy" "boolean" en_dmy) 
		list("via_to_next" "boolean"	via_to_next)
		list("via_diag" "boolean"	via_diag)
		list("ROP" "float" ROP+LEADDYO)
		list("LOP" "float" LOP+LEADDYI))
	)
	dbCreateParamInst(pcCellView mhalf nil 0:0 "MX" 1 
		list(
		list("OD" "float" OD)
		list("W" "float" W) 
		list("S" "float" S) 
		list("B_TK" "float" B_TK) 
		list("A_TK" "float" A_TK) 
		list("TOP_ME" "string" TOP_ME) 
		list("BTM_ME" "string" BTM_ME) 
		list("en_dmy" "boolean" en_dmy) 
		list("via_to_next" "boolean"	via_to_next)
		list("via_diag" "boolean"	via_diag)
		list("ROP" "float" ROP-LEADDYO)
		list("LOP" "float" LOP-LEADDYI)
	))
))
