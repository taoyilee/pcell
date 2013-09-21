/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strLibName="RFVLSI_N65"; 
strCellName="xfm_lct_t";	

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)  ; Inductor total width
	(WI	"float" 4.0)	
	(WO	"float" 2.0)	
	(S	"float"	2.0) 
	(CW	"float"	20.0) 
	(B_TK	"float"	0.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(A_TK	"float"	0.0) 
	(LOP "float"	10.0) 
	(ROP "float"	10.0) 
	(dummy "boolean"	t) 
	(TOP_ME "string"	"9") 
	(BTM_ME "string"	"9") 
	(text "string"	"xfm") 
	(DUMMYL "string" "RFVLSI") 

)
let((master PI PO),
	PI = WI + S
	PO = WO + S
	master = dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
	dbCreateParamInst(pcCellView master nil 0:0 "R0" 1
        	list(
      		list("OD"     "float" OD)  ; Inductor total width
        	list("W"      "float" WO)    
        	list("S"      "float" S) 
        	list("B_TK"   "float" B_TK) 
        	list("A_TK"   "float" A_TK) 
        	list("LEADDYI"   "float" LEADDYI) 
        	list("LEADDYO"   "float" LEADDYO) 
        	list("LOP" "float" LOP) 
        	list("ROP" "float"    ROP) 
        	list("TOP_ME" "string"    TOP_ME) 
        	list("BTM_ME" "string"    BTM_ME) 
	        list("DUMMYL" "string"  DUMMYL)
        	list("dummy" "boolean"   dummy) 
        )) ; close dbCreateParamInst

	dbCreateParamInst(pcCellView master nil PI+PO:0 "R0" 1
            list(
            list("OD"     "float" OD-2*(PI+PO))
            list("W"      "float" WO)
            list("S"      "float" S)
            list("B_TK"   "float" B_TK)
            list("A_TK"   "float" A_TK)
            list("LEADDYI"   "float" LEADDYI)
            list("LEADDYO"   "float" LEADDYO)
            list("LOP" "float" LOP)
            list("ROP" "float"   0.0)
            list("TOP_ME" "string"    TOP_ME)
            list("BTM_ME" "string"    BTM_ME)
            list("DUMMYL" "string"  DUMMYL)
            list("dummy" "boolean"   dummy)
        )) ; close dbCreateParamI


	if(dummy
	then
		dbCreateLabel(pcCellView, list("RFVLSI","drawing"), OD/2:0, text, "centerCenter", "R0", "roman", 2*PI)
	)

			dbCreateLabel(pcCellView, list("text","drawing"), OD/2:-3, "Add NT_N Manually!", "centerCenter", "R0", "roman", 2)

	cross = dbOpenCellViewByType(pcCellView~>lib "xfm_cross" "layout")
	crossa = dbCreateParamInst(pcCellView cross nil 0:0 "MX" 1
        list(
			list("WO" 	"float" WO)	
			list("WI" 	"float" WI)	
			list("S"	"float"	CW) 
			list("TOP_ME"	"string"	TOP_ME) 
			list("BTM_ME"	"string"	TOP_ME)
			list("LOP" "float"	LOP) 
			list("dummy" "boolean"	dummy) 
			list("viat" "boolean"	nil) 
			list("viad" "boolean"	nil) 
			list("top" "boolean"	t) 
        ) ; close list
        ) ; close 
	; Cross B MDOWN
	crossb=dbCreateParamInst(pcCellView cross nil 0:0 "R0" 1
        list(
			list("WO" 	"float" WO)	
			list("WI" 	"float" WI)	
			list("S" "float" CW)
			list("TOP_ME"  "string" TOP_ME)
			list("BTM_ME"  "string"	BTM_ME) 
			list("LOP" "float" LOP)
			list("dummy" "boolean"	dummy) 
			list("viat" "boolean"	t) 
			list("viad" "boolean"	t) 
			list("top" "boolean"	nil) 
        ) ; close list
        ) ; close dbCreateParamInst
)/*end of let*/
)/*end of pcDefinePCell*/
