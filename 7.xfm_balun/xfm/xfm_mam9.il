/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strLibName="RFVLSI_N65"
strCellName="xfm_mam9"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 180.0)	; Inductor total width
	(WI 	"float" 8.0)	
	(WO 	"float" 8.0)	
	(POP_IN 	"float" 40.0)	
	(POP_OUT 	"float" 10.0)	
	(LEAD 	"float" 20.0)	
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(S 	"float" 2.01) 
	(W_GND 	"float" 8.0) 
	(S_GND 	"float" 6.0) 
	(SPACING "float" 3.0) 
	(MEGND 	"string" "M1") ; ground pattern
	(CUT 	"float" 2.0) 
	(LOW_METAL "int" 8)
	(TOP_ME "int" 9)
	(BTM_ME "int" 9)
	(Cross_M8 "boolean" t)
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
	
)
let((PI PO master masterL),
	PI=WI+S	; Line pitch: width + space
	PO=WO+S	; Line pitch: width + space

	master = dbOpenCellViewByType(pcCellView~>lib "xfm_lct_t" "layout" );
	masterL = dbOpenCellViewByType(pcCellView~>lib "xfm_lead" "layout" );

	dbCreateParamInst(pcCellView master nil 0:0 "R0" 1  
		list(
			list("OD" 	"float" 	OD) ; Inductor total width
			list("W"	"float" 	WO)	
			list("S"	"float"		S) 
			list("CW"	"float"		WI+2*S) 
			list("OPENING"	"float" POP_IN) 
        		list("LEADDYI"   "float" LEADDYI) 
	        	list("LEADDYO"   "float" LEADDYO) 
		    	list("TOP_ME" "int" TOP_ME)
			list("BTM_ME" "int" BTM_ME)
			list("POP" 	"float"	POP_OUT/2)
		))


	dbCreateParamInst(pcCellView masterL nil -S:POP_IN/2+S+LEADDYI "MY" 1
        	list(
		        list("L"   "float" LEAD)  ; Inductor total width
		        list("W"   "float" WI)  
		        list("WD"   "float" 1.0)  
		        list("PINTXT" "string" "p1")
		        list("PINP" "string"  "dummy1")
	        	list("TOP_ME" "int" TOP_ME)
		        list("BTM_ME" "int" BTM_ME)
		        list("DUMMYL" "string" DUMMYL)
        		list("dummy" "boolean" dummy)
		))

    	dbCreateParamInst(pcCellView masterL nil -S:-POP_IN/2-WI-S+LEADDYI "MY" 1
	        list(
		        list("L"   "float" LEAD)  ; Inductor total width
		        list("W"   "float" WI)  
		        list("WD"   "float" 1.0)  
		        list("PINTXT" "string" "p2")
		        list("PINP" "string"  "dummy2")   
		        list("TOP_ME" "int" TOP_ME)
	        	list("BTM_ME" "int" BTM_ME)
		        list("DUMMYL" "string" DUMMYL)
		        list("dummy" "boolean" dummy)
		))

	; /**** LEAD UNDER PASS ****/  
	masterUD= dbOpenCellViewByType(pcCellView~>lib "under" "layout")
	lead_param = list(
	    list("W"   "float" WI)  
	    list("WX"   "float" WI)  
	    list("S"   "float" 2*S+WO)  
	    list("NT"   "int" 1)  
	    list("TOP_ME" "int" TOP_ME)
	    list("BTM_ME" "int" BTM_ME)
	    list("dummy" "boolean" t)
	    list("vias" "boolean" t)
	    list("top" "boolean" t)
	) ; close list
	dbCreateParamInst(pcCellView masterUD nil WO+S:POP_IN/2+S "R90" 1 lead_param) ; close dbCreateParamInst	
	dbCreateParamInst(pcCellView masterUD nil WO+S:-POP_IN/2-WI-S "R90" 1 lead_param)

	instL3=dbCreateParamInst(pcCellView masterL nil OD:POP_OUT/2+LEADDYO "R0" 1
	    list(
	    list("L"   "float" LEAD)  ; Inductor total width
	    list("W"   "float" WO)  
	    list("WD"   "float" 1.0)  
	    list("PINTXT" "string" "p3") 
	    list("PINP" "string"  "dummy3")   
	    list("TOP_ME" "int" TOP_ME)
	    list("BTM_ME" "int" BTM_ME)
	    list("DUMMYL" "string" DUMMYL)
    	list("dummy" "boolean" dummy)
	))
	instL4=dbCreateParamInst(pcCellView masterL nil OD:-POP_OUT/2-WO+LEADDYO "R0" 1  
	    list(
		list("L"   "float" LEAD)  ; Inductor total width
	    list("W"   "float" WO)  
	    list("WD"   "float" 1.0)  
	    list("PINTXT" "string" "p4") 
	    list("PINP" "string"  "dummy4")   
	    list("TOP_ME" "int" TOP_ME)
	    list("BTM_ME" "int" BTM_ME)
	    list("DUMMYL" "string" DUMMYL)
	    list("dummy" "boolean" dummy)
	))

	/* Inner L WI */
	MhalfUD = dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
	inst=dbCreateParamInst(pcCellView MhalfUD nil WO+S:0 "R0" 1
	list(
        list("OD"   "float" OD-2*(WO+S)) ; Inductor total width
        list("W"   "float" WI)  
        list("S"   "float" S) 
        list("OPENING" "float" POP_IN+2*S) 
        list("POP" "float"  0.0) 
        list("TOP_ME" "int"  TOP_ME) 
        list("BTM_ME" "int"  BTM_ME) 
        list("DUMMYL" "string" "RFVLSI") 
        list("dummy" "boolean"  dummy) 
	)) ; close dbCreateParamInst

	instii=dbCreateParamInst(pcCellView MhalfUD nil WO+WI+2*S:0 "R0" 1
	list(
        list("OD"   "float" OD-2*(WO+S)-2*(WI+S)) ; Inductor total width
        list("W"   "float" WO)  
        list("S"   "float" S) 
        list("OPENING" "float" POP_IN) 
        list("POP" "float"  0.0) 
        list("TOP_ME" "int"  TOP_ME) 
        list("BTM_ME" "int"  BTM_ME) 
        list("DUMMYL" "string" "RFVLSI") 
        list("dummy" "boolean"  dummy) 
    )) ; close dbCreateParamInst


)/*end of let*/
)/*end of pcDefinePCell*/

