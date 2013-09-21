strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="xfm_tg";	Cell Name

; Define my parameterized cell with the information above
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 180.0)	; Inductor total width
	(WI  	"float" 8.0)	; Line width
	(WO  	"float" 8.0)	; Line width
	(POP_IN  	"float" 40.0)	; Line width
	(POP_OUT  	"float" 10.0)	; Line width
	(LEAD  	"float" 20.0)	; Line width
	(S  	"float" 2.01) ; Line spacing
	(W_GND  	"float" 8.0) ; Line spacing
	(S_GND  	"float" 6.0) ; Line spacing
	(SPACING "float" 3.0) ; Line spacing
	(MEGND 	"string" "M1") ; ground pattern
	(CUT 	"float" 2.0) ; Line spacing
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	(Cross_M8 "boolean" t)
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
	
)
let((PI PO),
PI=WI+S	; Line pitch: width + space
PO=WO+S	; Line pitch: width + space
; Last cycle is always different, depending on parameter NT 
	master = dbOpenCellViewByType(pcCellView~>lib "xfm_lct_t" "layout" );
	inst=dbCreateParamInst(
        pcCellView master nil 0:0 "R0" 1   
        list(
			list("OD" 	"float" 	OD)  ; Inductor total width
			list("W"	"float" 	WO)	; Line width
			list("S"	"float"		S) ; Line spacing
			list("CW"	"float"		WI+2*S) ; Line spacing
			list("OPENING"	"float"	POP_IN) ; Line spacing
	       	list("TOP_ME" "string" TOP_ME)
	        list("BTM_ME" "string" BTM_ME)
			list("POP" 	"float"	POP_OUT/2) ; Line spacing
        ) ; close list
        ) ; close dbCreateParamInst

masterL = dbOpenCellViewByType(pcCellView~>lib "xfm_lead" "layout" );
	instL3=dbCreateParamInst(pcCellView masterL nil OD:POP_OUT/2 "R0" 1
	        list(
	        list("L"      "float" LEAD)   ; Inductor total width
	        list("W"      "float" WO)    ; Line width
	        list("WD"     "float" 1.0)    ; Line width
	        list("PINTXT" "string" "p3")  ; Line width
	        list("PINP" "string"   "dummy3")      ; Line width
	        list("TOP_ME" "string" TOP_ME)
	        list("BTM_ME" "string" BTM_ME)
	        list("DUMMYL" "string" DUMMYL)
        	list("dummy" "boolean" dummy)
	))
	instL4=dbCreateParamInst(pcCellView masterL nil OD:-POP_OUT/2-WO "R0" 1   
	        list(
		list("L"      "float" LEAD)   ; Inductor total width
	        list("W"      "float" WO)    ; Line width
	        list("WD"     "float" 1.0)    ; Line width
	        list("PINTXT" "string" "p4")  ; Line width
	        list("PINP" "string"   "dummy4")      ; Line width
	        list("TOP_ME" "string" TOP_ME)
	        list("BTM_ME" "string" BTM_ME)
	        list("DUMMYL" "string" DUMMYL)
	        list("dummy" "boolean" dummy)
	))

/* Inner L WI */
MhalfUD = dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
inst=dbCreateParamInst(
        pcCellView MhalfUD nil  WO+S:0 "R0" 1
        list(
                list("OD"     "float" OD-2*(WO+S))  ; Inductor total width
                list("W"      "float" WI)    ; Line width
                list("S"      "float" S) ; Line spacing
                list("OPENING" "float" POP_IN) ; Line spacing
                list("POP" "float"    0.0) ; Line spacing
                list("TOP_ME" "string"    TOP_ME) ; Line spacing
                list("BTM_ME" "string"    BTM_ME) ; Line spacing
                list("DUMMYL" "string"  "RFVLSI") ; Line spacing
                list("dummy" "boolean"   dummy) ; Line spacing
        )) ; close dbCreateParamInst

instii=dbCreateParamInst(
        pcCellView MhalfUD nil  WO+WI+2*S:0 "R0" 1
        list(
                list("OD"     "float" OD-2*(WO+S)-2*(WI+S))  ; Inductor total width
                list("W"      "float" WO)    ; Line width
                list("S"      "float" S) ; Line spacing
                list("OPENING" "float" POP_IN) ; Line spacing
                list("POP" "float"    0.0) ; Line spacing
                list("TOP_ME" "string"    TOP_ME) ; Line spacing
                list("BTM_ME" "string"    BTM_ME) ; Line spacing
                list("DUMMYL" "string"  "RFVLSI") ; Line spacing
                list("dummy" "boolean"   dummy) ; Line spacing
        )) ; close dbCreateParamInst
; /**** LEAD UNDER PASS ****/    
	masterUD= dbOpenCellViewByType(pcCellView~>lib "xfm_under" "layout")
	dbCreateParamInst(pcCellView masterUD nil (-S-WI):(POP_IN/2) "R0" 1
		list(
		list("L"      "float" 2*(WI+S)+WI)   ; Inductor total width
	        list("W"      "float" WI)    ; Line width
	        list("TOP_ME" "string" TOP_ME)
	        list("BTM_ME" "string" BTM_ME)
	        list("dummy" "boolean" t)
	        list("vias" "boolean" t)
        ) ; close list
	) ; close dbCreateParamInst	
	
	dbCreateParamInst(pcCellView masterUD nil (-S-WI):-POP_IN/2-WI "R0" 1
		list(
		list("L"      "float" 2*(WI+S)+WI)   ; Inductor total width
	        list("W"      "float" WI)    ; Line width
	        list("TOP_ME" "string" TOP_ME)
	        list("BTM_ME" "string" BTM_ME)
	        list("dummy" "boolean" t)
	        list("vias" "boolean" t)
        ) ; close list
	) ; close dbCreateParamInst	

        instL1=dbCreateParamInst(pcCellView masterL nil -S:POP_IN/2 "MY" 1
                list(
                list("L"      "float" LEAD)   ; Inductor total width
                list("W"      "float" WI)    ; Line width
                list("WD"     "float" 1.0)    ; Line width
                list("PINTXT" "string" "p1") 
                list("PINP" "string"   "dummy1")
                list("TOP_ME" "string" TOP_ME)
                list("BTM_ME" "string" BTM_ME)
                list("DUMMYL" "string" DUMMYL)
                list("dummy" "boolean" dummy)
        ))
        instL2=dbCreateParamInst(pcCellView masterL nil -S:-POP_IN/2-WI "MY" 1
                list(
                list("L"      "float" LEAD)   ; Inductor total width
                list("W"      "float" WI)    ; Line width
                list("WD"     "float" 1.0)    ; Line width
                list("PINTXT" "string" "p2")
                list("PINP" "string"   "dummy2")      ; Line width
                list("TOP_ME" "string" TOP_ME)
                list("BTM_ME" "string" BTM_ME)
                list("DUMMYL" "string" DUMMYL)
                list("dummy" "boolean" dummy)
        ))


)/*end of let*/
)/*end of pcDefinePCell*/

