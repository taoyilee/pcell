/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strCellName="base_xfm_power"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 150.0)  ; Inductor total width
	(DOD2 	"float" 10.0)  ; Inductor total width
	(WI	"float" 4.0)	
	(WO	"float" 2.0)	
	(M8_S	"float" 3.0)	
	(S	"float"	3.0) 
	(B_TK	"float"	0.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(A_TK	"float"	0.0) 
	(ROP "float"	10.0) 
	(LOP "float"	4.0) 
	(en_dmy "boolean"	t) 
	(en_NTN "boolean"	nil) 
	(en_HighK "boolean"	t)
	(text "string"	"xfm") 
)
let((PI PO master param masterc m_oct_half),
	PI = WI + S
	PO = WO + S	
	/* Thin Line (Outer) typ. connected to PAD */
	/* AC Current only */
	master = dbOpenCellViewByType(pcCellView~>lib "base_highk_ud" "layout" );
	m_oct_half = dbOpenCellViewByType(pcCellView~>lib "base_oct_half" "layout" );
    dbCreateParamInst(pcCellView master nil 0:0 "R0" 1 /* outer turn */
    list(
					list("OD" "float" OD)  
	    			list("WO"  "float" WO)
	    			list("WI"  "float" WI)
				    list("S"  "float" S)
				    list("LOP" "float" S + WI/2 + WO)
				    list("ROP" "float" ROP)
				    list("LOP_M8" "float" LOP+WI+MinMetSpacing(8))
				    list("ROP_M8" "float" ROP)
				    list("LEADDYI"    "float" LEADDYI)
				    list("LEADDYO"    "float" LEADDYO)
				    list("TOP_ME" "string"    "9")
				    list("BTM_ME" "string"    "9")
				    list("via_to_next" "boolean"  nil)
				    list("via_diag" "boolean" nil)
					list("align_left" "boolean"	t) 
        ))
    dbCreateParamInst(pcCellView master nil 0:0 "R0" 1 /* inner turn */
    	list(
					list("OD" "float" OD-2*(PI+PO))  
	    			list("WO"  "float" (WO+DOD2))
	    			list("WI"  "float" WI)
				    list("S"  "float" S)
				    list("LOP" "float" S + WI/2 + WO)
				    list("ROP" "float" 0.0)
				    list("LOP_M8" "float" LOP+WI+MinMetSpacing(8))
				    list("ROP_M8" "float" 0.0)
				    list("LEADDYI"    "float" LEADDYI)
				    list("LEADDYO"    "float" LEADDYO)
				    list("TOP_ME" "string"    "9")
				    list("BTM_ME" "string"    "9")
					list("align_left" "boolean"	nil) 
        ))
	masterc = dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout" );

	dbCreateParamInst(pcCellView masterc nil (-OD/2):0 "R0" 1 list(
		list("WO"  "float" WO)
		list("WI"  "float" WI)
	    list("S"  "float" S) 
	    list("TOP_ME" "int"   9) 
	    list("BTM_ME" "int"   9) 
	    list("en_dmy"   "boolean"  en_dmy) 
    	list("top"    "boolean"   t)
	))

	dbCreateParamInst(pcCellView masterc nil (2*WO+2*S+WI-OD/2):0 "MY" 1 list(
		list("WO"  "float" WO)
		list("WI"  "float" WI)
        list("S"  "float" S)
        list("TOP_ME" "int"   9)
        list("BTM_ME" "int"   8)
        list("en_dmy"   "boolean"  en_dmy)
        list("top"    "boolean"   nil)
    ))
))
