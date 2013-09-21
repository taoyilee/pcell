/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="ind_sym_cct2T"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 70.0)	 
	(W  	"float" 2.0)	 
	(S  	"float" 2.0)  
	(OPENING  	"float" 10.0)	 
	(OPENCT  	"float" 5.0)	 
	(LEAD  	"float" 10.0)	 
	(TOP_ME "string" "9")
	(L12 "string" "1n")
	(L34 "string" "1n")
	(BTM_ME "string" "9")
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
	(NT_N		"boolean" nil)
)
let((P m_lead i m_oct m_vias m_base_oct_fill LOP m_base_xfm_cross pi C C2 OO OOC OOCH),
	P=W+S	
	pi = 3.141592
    C=roundtogrid(W*tan(pi/8))
    C2=roundtogrid(C/sqrt(2))
    OO = 2*W+S
    OOC = 2*W+S-2*C2
    OOCH = OOC/2

	dbCreateLabel(pcCellView, list(DUMMYL, "dummy5"), 0:3, sprintf(nil "%L" W), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy6"), 0:5, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), 0:7, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 1)
	m_lead = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )

    m_base_oct_fill = dbOpenCellViewByType(pcCellView~>lib "base_oct_fill" "layout" )
	LOP = OOCH + roundtogrid(2*sqrt(2.0)- S)+0.01

        dbCreateParamInst(pcCellView m_base_oct_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI")
            list("purp" "string"  "drawing")))
        dbCreateParamInst(pcCellView m_base_oct_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI_LVS")
            list("purp" "string"  "dummy8")))
        dbCreateParamInst(pcCellView m_base_oct_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI_LVS")
            list("purp" "string"  "dummy9")))

	m_oct = dbOpenCellViewByType(pcCellView~>lib "base_oct" "layout" )
m_base_xfm_cross = dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout")
	dbCreateLabel(pcCellView, list(DUMMYL, "drawing"), 0:0, "ind_sym_cct2T", "centerCenter", "R0", "roman", 1)

	if(!NT_N
	then
		dbCreateLabel(pcCellView, list("text", "drawing"), 0:0, "Add NT_N Manually!", "centerCenter", "R0", "roman", 3)
	)

	dbCreateParamInst(pcCellView m_base_xfm_cross nil  -OD/2:0 "R0" 1
            list(
                list("WO"      "float" W)    ; Line width
                list("WI"      "float" S)    ; Line width
                list("S"      "float"  0.0)
                list("OP"      "float" 2*LOP)
    )) ; close dbCreateParamInst


	dbCreateParamInst(pcCellView m_base_xfm_cross nil  -OD/2+2*W+S:0 "MY" 1
            list(
                list("WO"      "float" W)    ; Line width
                list("WI"      "float" S)    ; Line width
                list("S"      "float"  0.0)
                list("TOP_ME"      "int"  9)
                list("BTM_ME"      "int"  9)
                list("OP"      "float" 2*LOP)
    )) ; close dbCreateParamInst

	dbCreateParamInst(pcCellView m_oct nil  0:0 "R0" 1 
	list(
                        list("OD"     "float" OD)   
                        list("W"      "float" W)     
                        list("S"      "float" S)  
                        list("LOP" "float" LOP)
                        list("ROP" "float" OPENING)
                        list("TOP_ME" "string"    TOP_ME)  
                        list("BTM_ME" "string"    BTM_ME)  
                        list("DUMMYL" "string"  "RFVLSI")  
                        list("dummy" "boolean"   dummy)  
	))

	dbCreateParamInst(pcCellView m_oct nil  0:0 "R0" 1 
			list(
                        list("OD"     "float" OD-2*P)
                        list("W"      "float" W)     
                        list("S"      "float" S)  
                        list("LOP" "float" LOP)
                        list("ROP" "float" OPENCT)
                        list("TOP_ME" "string"    TOP_ME)  
                        list("BTM_ME" "string"    BTM_ME)  
                        list("DUMMYL" "string"  "RFVLSI")  
                        list("dummy" "boolean"   dummy)  
                        list("under" "boolean"  nil)  
	        ))
	 /**** LEAD UNDER PASS ****/    
	dbCreateParamInst(pcCellView m_lead nil OD/2:0 "R0" 1
                list(
                list("LEAD"      "float" LEAD)    
                list("OPENING"      "float" OPENING)    
                list("W"      "float" W)     
                list("P1TXT" "string" "P1") 
                list("N1TXT" "string" "N1") 
                list("TOP_ME" "string" TOP_ME)
                list("BTM_ME" "string" BTM_ME)
                list("DUMMYL" "string" DUMMYL)
                list("dummy" "boolean" dummy)
	))

		dbCreateParamInst(pcCellView m_lead nil OD/2-P:0 "R0" 1
    	    list(
                list("LEAD"      "float" LEAD+P)    
                list("OPENING"      "float" OPENCT)    
                list("W"      "float" W)     
                list("P1TXT" "string" "CTp")
                list("N1TXT" "string" "CTn")
                list("TOP_ME" "string" "9")
                list("BTM_ME" "string" "9")
                list("DUMMYL" "string" DUMMYL)
                list("dummy" "boolean" dummy)
	    ))


 /* EM definitions */
                /* EM Guard-ring */
        rfvlsiEMDummyCreateParamInst(pcCellView m_vias nil -OD/2-LEAD:-OD/2-10.0 "R0" 1
        list(
        list("Width"    "float" 5.0)
        list("Length"   "float" OD+20.0)
        list("TOP_ME"   "int" 1)
        list("BTM_ME"   "int" 1)
    ) 1)
                /* EM Guard-ring */
    rfvlsiEMDummyCreateParamInst(pcCellView m_vias nil OD/2+LEAD:-OD/2-10.0 "MY" 1
        list(
        list("Width"    "float" 5.0)
        list("Length"   "float" OD+20.0)
        list("TOP_ME"   "int" 1)
        list("BTM_ME"   "int" 1)
    ) 1)
                /* EM Guard-ring */
    rfvlsiEMDummyCreateParamInst(pcCellView m_vias nil -OD/2-LEAD:OD/2+5.0 "R0" 1
        list(
        list("Width"    "float" OD+2*LEAD)
        list("Length"   "float" 5.0)
        list("TOP_ME"   "int" 1)
        list("BTM_ME"   "int" 1)
    ) 1)
                /* EM Guard-ring */
    rfvlsiEMDummyCreateParamInst(pcCellView m_vias nil -OD/2-LEAD:-OD/2-5.0 "MX" 1
        list(
        list("Width"    "float" OD+2*LEAD)
        list("Length"   "float" 5.0)
        list("TOP_ME"   "int" 1)
        list("BTM_ME"   "int" 1)
    ) ,1)

    rfvlsiEMVport("CTp",OD/2+LEAD, OPENCT,OD/2+LEAD,OPENCT+W,0,8,1);
    rfvlsiEMVport("CTn",OD/2+LEAD, -OPENCT,OD/2+LEAD,-OPENCT-W,0,8,1);

    rfvlsiEMVport("P1",OD/2+LEAD, OPENING,OD/2+LEAD,OPENING+W,0,8,1);
    rfvlsiEMVport("N1",OD/2+LEAD, -OPENING,OD/2+LEAD,-OPENING-W,0,8,1);
        boundary_ext = 10
    rfvlsiEMBoundary(-OD - boundary_ext,-OD-boundary_ext,-300.0, 2*(OD+boundary_ext),2*(OD+boundary_ext),600.0,1)
    rfvlsiEMDie(-OD - boundary_ext*.9,-OD-boundary_ext*0.9, 2*(OD+boundary_ext*0.9), 2*(OD+boundary_ext*0.9),1)
        /* END OF EM definitions */

)/*end of let*/
)/*end of pcDefinePCell*/
