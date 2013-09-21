	/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
		Intended for Internal Use Only, All Rights Reserved, 2012 
		*DO NOT DISCLOSE*
		Author : Tao-Yi Lee */
	
strCellName="ind_sym_cct4T"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)	 
	(W 	"float" 3.0)	 
	(OPENING 	"float" 15.0)	 
	(OPENCT 	"float" 10.0)	 
	(LEAD 	"float" 20.0)	 
	(S 	"float" 2.0) 	
	(L12 "string" "1n")
	(L34 "string" "1n")
	(dummy "boolean" t)
	(NT_N		"boolean" nil)
)
let((P i master_t m_vias m_lead_pair m_base_oct_fill),
	P=W+S	
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy5"), 0:3, sprintf(nil "%L" W), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy6"), 0:5, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy7"), 0:7, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list("RFVLSI", "drawing"), 0:0, "ind_sym_cct4T", "centerCenter", "R0", "roman", 3)
	
	master_t = dbOpenCellViewByType(pcCellView~>lib "base_ind_sym_cct4T_t" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )	

	 m_base_oct_fill = dbOpenCellViewByType(pcCellView~>lib "base_oct_fill" "layout" )

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

	if(!NT_N
	then
		dbCreateLabel(pcCellView, list("text", "drawing"), 0:0, "Add NT_N Manually!", "centerCenter", "R0", "roman", 3)
	)
	dbCreateParamInst(pcCellView master_t nil 0:0 "R0" 1 
		list(
		list("OD" "float" OD) 
		list("W" "float" W) 
		list("S" "float" S) 
		list("OPENING" "float" OPENING)
		list("TOP_ME" "string" "9") 
		list("BTM_ME" "string" "8") 		
		list("dummy" "boolean" dummy) 
		list("under" "boolean" t) 
	))

	dbCreateParamInst(pcCellView master_t nil 0:0 "MY" 1 
		list(
		list("OD" "float" OD-2*P) 
		list("W" "float" W) 
		list("S" "float" S) 
		list("OPENING" "float" 2*W)
		list("TOP_ME" "string" "9") 
		list("BTM_ME" "string" "8") 
		list("dummy" "boolean" dummy) 
		list("under" "boolean" t) 
	))
		
	dbCreateParamInst(pcCellView master_t nil 0:0 "R0" 1 
		list(
		list("OD" "float" OD-4*P) 
		list("W" "float" W) 
		list("S" "float" S) 
		list("OPENING" "float" 2*W)
		list("TOP_ME" "string" "9") 
		list("BTM_ME" "string" "8") 
		list("dummy" "boolean" dummy) 
		list("under" "boolean" t) 
	))
	
	dbCreateParamInst(pcCellView master_t nil 0:0 "R0" 1 
		list(
		list("OD" "float" OD-6*P)
		list("W" "float" W) 
		list("S" "float" S) 
		list("OPENING" "float" OPENCT)
		list("TOP_ME" "string" "9") 
		list("BTM_ME" "string" "8") 
		list("dummy" "boolean" dummy) 
		list("under" "boolean" nil) 
		)
	)
	/**** PORT 2 / PORT 3 ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil OD/2:0 "R0" 1
		list(
			list("W" 	"float" W)	 
			list("OPENING" 	"float" OPENING)	 
			list("LEAD" 	"float" LEAD)	 	
			list("TOP_ME" "string" "9")
			list("LEAD_ME" "string" "9")	
			list("dummy" "boolean" dummy)			
			list("P1TXT" "string" "P1")
			list("N1TXT" "string" "N1")
	))
	/**** PORT 2 / PORT 3 ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil OD/2-4*P+S:0 "R0" 1
		list(
			list("W" 	"float" W)	 
			list("OPENING" 	"float" OPENCT)	 
			list("LEAD" 	"float" 3*P+W+LEAD)
			list("TOP_ME" "string" "9")
			list("LEAD_ME" "string" "8")	
			list("dummy" "boolean" dummy)
			list("P1TXT" "string" "CT8p")
			list("N1TXT" "string" "CT8n")
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


))
