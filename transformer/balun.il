/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strCellName="balun"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 190.0)
	(WI 	"float" 4.0)	
	(WO 	"float" 2.0)	
	(LOP 	"float" 10.0)	
	(ROP 	"float" 7.0)	
	(LEAD 	"float" 20.0)	
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(S 	"float" 2.05) 
	(DIVO "float" 3.35)
	(DIVI "float" 3.3)
	(dummy "boolean" t)
	(NT_N "boolean" t)
	(DUMMYL "string" "RFVLSI")
	(balun_str "string" "balun")
	
)
let((PI PO masterp masters masterL masterUD),
	PI=WI+S	; Line pitch: width + space
	PO=WO+S	; Line pitch: width + space
	masterp = dbOpenCellViewByType(pcCellView~>lib "base_balun_pri" "layout" );
	masters = dbOpenCellViewByType(pcCellView~>lib "base_balun_sec" "layout" );
	masterL = dbOpenCellViewByType(pcCellView~>lib "base_lead" "layout" );
	masterUD= dbOpenCellViewByType(pcCellView~>lib "base_ind_under" "layout")

	if(dummy
	then
		dbCreateLabel(pcCellView, list("RFVLSI","drawing"), OD/2:0, balun_str, "centerCenter", "R0", "roman", 2*PI)
	)

    dbCreateLabel(pcCellView, list(DUMMYL, "dummy6"), OD/2:3, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 2)
    dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), OD/2:7, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 2)
    dbCreateLabel(pcCellView, list(DUMMYL, "dummy8"), OD/2:11, sprintf(nil "%L" WI), "centerCenter", "R0", "roman", 2)
    dbCreateLabel(pcCellView, list(DUMMYL, "dummy9"), OD/2:15, sprintf(nil "%L" WO), "centerCenter", "R0", "roman", 2)


	dbCreateParamInst(pcCellView masterp nil 0:0 "R0" 1  
		list(
			list("OD" 	"float" 	OD) ; Inductor total width
			list("WI"	"float" 	WI)	
			list("WO"	"float" 	WO)	
			list("S"	"float"		S) 
			list("DIV"	"float"	DIVO) 
			list("LOP"	"float" LOP) 
        	list("LEADDYI"   "float" LEADDYI) 
	        list("LEADDYO"   "float" LEADDYO) 
		    list("TOP_ME" "string" "9")
			list("text" "string" balun_str)
			list("ROP" 	"float"	ROP)
			list("NT_N" "boolean" NT_N)
		))

	dbCreateParamInst(pcCellView masters nil PO:0 "R0" 1
        list(
            list("OD"   "float"     OD-2*PO) 
            list("WI"    "float"     WI)
            list("WO"    "float"     WO)
            list("S"    "float"     S)
            list("DIV"  "float" DIVI)
            list("LEADDYI"   "float" LEADDYI)
            list("LEADDYO"   "float" LEADDYO)
            list("TOP_ME" "string" "9")
            list("text" "string" balun_str)
            list("LOP"  "float" LOP)
        ))


	dbCreateParamInst(pcCellView masterL nil -S:ROP "MY" 1
        	list(
		        list("L"   "float" LEAD)  ; Inductor total width
		        list("W"   "float" WI)  
		        list("WD"   "float" 1.0)  
		        list("PINTXT" "string" "P1")
		        list("PINP" "string"  "dummy1")
	        	list("TOP_ME" "string" "9")
		        list("BTM_ME" "string" "9")
		        list("DUMMYL" "string" DUMMYL)
        		list("dummy" "boolean" dummy)
		))

    	dbCreateParamInst(pcCellView masterL nil -S:-ROP-WI "MY" 1
	        list(
		        list("L"   "float" LEAD)  ; Inductor total width
		        list("W"   "float" WI)  
		        list("WD"   "float" 1.0)  
		        list("PINTXT" "string" "N1")
		        list("PINP" "string"  "dummy1")   
		        list("TOP_ME" "string" "9")
	        	list("BTM_ME" "string" "9")
		        list("DUMMYL" "string" DUMMYL)
		        list("dummy" "boolean" dummy)
		))

	; /**** LEAD UNDER PASS ****/  
	lead_param = list(
	    list("W"   "float" WI)  
	    list("WX"   "float" WI)  
	    list("S"   "float" 2*S+WO)  
	    list("NT"   "int" 1)  
		list("TOP_ME" "string" "9")
	    list("BTM_ME" "string" "8")
	    list("dummy" "boolean" t)
	    list("vias" "boolean" t)
	    list("top" "boolean" t)
	) ; close list
	dbCreateParamInst(pcCellView masterUD nil PO:ROP "R90" 1 lead_param) ; close dbCreateParamInst	
	dbCreateParamInst(pcCellView masterUD nil PO:-ROP-WI "R90" 1 lead_param)

	instL3=dbCreateParamInst(pcCellView masterL nil OD:ROP+LEADDYO "R0" 1
	    list(
	    list("L"   "float" LEAD)  ; Inductor total width
	    list("W"   "float" WO)  
	    list("WD"   "float" 1.0)  
	    list("PINTXT" "string" "P2") 
	    list("PINP" "string"  "dummy1")   
		list("TOP_ME" "string" "9")
	    list("BTM_ME" "string" "8")
	    list("DUMMYL" "string" DUMMYL)
    	list("dummy" "boolean" dummy)
	))
	instL4=dbCreateParamInst(pcCellView masterL nil OD:-ROP-WO+LEADDYO "R0" 1  
	    list(
		list("L"   "float" LEAD)  ; Inductor total width
	    list("W"   "float" WO)  
	    list("WD"   "float" 1.0)  
	    list("PINTXT" "string" "N2") 
	    list("PINP" "string"  "dummy1")  
	    list("TOP_ME" "string" "9")
	    list("BTM_ME" "string" "8")
	    list("DUMMYL" "string" DUMMYL)
	    list("dummy" "boolean" dummy)
	))

)/*end of let*/
)/*end of pcDefinePCell*/

