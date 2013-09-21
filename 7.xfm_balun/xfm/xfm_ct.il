/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strLibName="RFVLSI_N65"
strCellName="xfm_ct"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 180.0)	; Inductor total width
	(WI 	"float" 4.0)	
	(WO 	"float" 2.0)	
	(ROP 	"float" 20.0)	
	(LOP 	"float" 20.0)	
	(LEAD 	"float" 20.0)	
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(S 	"float" 2.0) 
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
	(xfm_str "string" "xfm_ct")
	
)
let((),
	dbCreateParamInst(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "xfm" "layout" );
		nil 0:0 "R0" 1  
		list(
			list("OD" 	"float" 	OD) 
			list("WI"	"float" 	WI)	
			list("WO"	"float" 	WO)	
			list("S"	"float"		S) 
      		list("LEADDYI"   "float" LEADDYI) 
      		list("LEAD"   "float" LEAD) 
        	list("LEADDYO"   "float" LEADDYO) 
        	list("dummy"   "boolean" dummy)
        	list("DUMMYL"   "string" DUMMYL)
	    	list("TOP_ME" "string" TOP_ME)
			list("BTM_ME" "string" BTM_ME)
			list("xfm_str" "string" xfm_str)
			list("ROP" 	"float"	ROP)
			list("LOP" 	"float"	LOP)
		))
    dbCreateLabel(pcCellView, list(DUMMYL, "dummy1"), OD-WI/2-WO-S:0, "CT", "centerCenter", "R0", "roman", WO)
    dbCreateRect(pcCellView, list(DUMMYL, "dummy1"), list(OD-WI-WO-S:-WI/2 OD-WO-S:WI/2))

)/*end of let*/
)/*end of pcDefinePCell*/

