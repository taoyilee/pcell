/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strLibName="RFVLSI_N65"
strCellName="balun_sec"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)  ; Inductor total width
	(WI	"float" 4.0)	
	(WO	"float" 4.0)	
	(S	"float"	2.0) 
	(CW	"float"	20.0) 
	(B_TK	"float"	0.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(A_TK	"float"	0.0) 
	(LOP "float"	10.0) 
	(dummy "boolean"	t) 
	(DUMMYL "string" "RFVLSI") 
)
let((),

	dbCreateParamInst(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
		nil 0:0 "R0" 1
        	list(
      		list("OD"     "float" OD)  ; Inductor total width
        	list("W"      "float" WI)    
        	list("S"      "float" S) 
        	list("B_TK"   "float" B_TK) 
        	list("A_TK"   "float" A_TK) 
        	list("LEADDYI"   "float" LEADDYI) 
        	list("LEADDYO"   "float" LEADDYO) 
        	list("ROP" "float" 0.0) 
        	list("LOP" "float" LOP) 
        	list("TOP_ME" "string"    "9")
        	list("BTM_ME" "string"   "9") 
	        list("DUMMYL" "string"  DUMMYL)
        	list("dummy" "boolean"   dummy) 
        )) ; close dbCreateParamInst


)/*end of let*/
)/*end of pcDefinePCell*/
