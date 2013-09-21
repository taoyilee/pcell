/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="tcoil"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 80.0)	 
	(W  	"float" 3.0)	 
	(OPENING  	"float" 10.0)	 
	(OPENCT  	"float" 5.0)	 
	(LEAD  	"float" 10.0)	 
	(S  	"float" 3.0)  
	(TOP_ME "string" "9")
	(L12 "string" "1n")
	(L34 "string" "1n")
	(BTM_ME "string" "9")
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
	(NT_N		"boolean" nil)
)
let((P m_lead i m_turn boundary_ext),
	P = W+S	
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy5"), 0:3, sprintf(nil "%L" W), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy6"), 0:5, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), 0:7, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy8"), 0:9, sprintf(nil "%L" L12), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy8"), 0:11, sprintf(nil "%L" L34), "centerCenter", "R0", "roman", 1)
	m_lead = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_turn = dbOpenCellViewByType(pcCellView~>lib "base_ind_sym_cct2T_t" "layout" )
	dbCreateLabel(pcCellView, list(DUMMYL, "drawing"), OD/2:0, "tcoil", "centerCenter", "R0", "roman", 1)

	if(!NT_N
	then
		dbCreateLabel(pcCellView, list("text", "drawing"), 0:0, "Add NT_N Manually!", "centerCenter", "R0", "roman", 3)
	)

	dbCreateParamInst(pcCellView m_turn nil  0:0 "R0" 1 
	list(
                        list("OD"     "float" OD)   
                        list("W"      "float" W)     
                        list("S"      "float" S)  
                        list("OPENING" "float" OPENING)
                        list("TOP_ME" "string"    TOP_ME)  
                        list("BTM_ME" "string"    BTM_ME)  
                        list("DUMMYL" "string"  "RFVLSI")  
                        list("dummy" "boolean"   dummy)  
	))

	dbCreateParamInst(pcCellView m_turn nil  0:0 "R0" 1 
	list(
    	list("OD"     "float" OD-2*P)
        list("W"      "float" W)     
        list("S"      "float" S)  
                        list("OPENING" "float" OPENCT)
                        list("TOP_ME" "string"    TOP_ME)  
                        list("BTM_ME" "string"    BTM_ME)  
                        list("DUMMYL" "string"  "RFVLSI")  
                        list("dummy" "boolean"   dummy)  
                        list("under" "boolean"  nil)  
	        ))
	 /**** LEAD UNDER PASS ****/    
	dbCreateParamInst(pcCellView m_lead nil OD/2:0 "R0" 1
		list(
			list("W"  "float" W)
		    list("OPENING"    "float" OPENING)
		    list("LEAD"   "float" LEAD)
		    list("TOP_ME" "string" "9")
		    list("LEAD_ME" "string" "9")
		    list("dummy" "boolean" t)
		    list("P1TXT" "string" "P1")
		    list("N1TXT" "string" "N1")
		))
	 /**** LEAD UNDER PASS for center-taps****/    
	dbCreateParamInst(pcCellView m_lead nil OD/2-P:0 "R0" 1
    	    list(
			list("W"  "float" W)
		    list("OPENING"    "float" OPENCT)
		    list("LEAD"   "float" LEAD+P)
		    list("TOP_ME" "string" "9")
		    list("LEAD_ME" "string" "9")
		    list("dummy" "boolean" t)
		    list("P1TXT" "string" "CTp")
		    list("N1TXT" "string" "CTn")
    ))
	 /**** LEAD UNDER PASS for center-taps****/    
	dbCreateParamInst(pcCellView m_lead nil -OD/2:0 "MY" 1
    	    list(
			list("W"  "float" W)
		    list("OPENING"    "float" OPENCT)
		    list("LEAD"   "float" LEAD)
		    list("TOP_ME" "string" "9")
		    list("LEAD_ME" "string" "9")
		    list("dummy" "boolean" t)
		    list("P1TXT" "string" "OP")
		    list("N1TXT" "string" "ON")
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

    rfvlsiEMVport("OP",-OD/2-LEAD,OPENCT,-OD/2-LEAD,OPENCT+W,0,8,1);
    rfvlsiEMVport("ON",-OD/2-LEAD,-OPENCT,-OD/2-LEAD,-OPENCT-W,0,8,1);

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
