/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="ind_sym_ct"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)	 
	(W  	"float" 2.0)	 
	(OPENING  	"float" 10.0)	 
	(LEAD  	"float" 10.0)	 
	(S  	"float" 2.0)  
	(TOP_ME "string" "9")
	(NT "int" 2)
	(BTM_ME "string" "9")
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
	(NT_N		"boolean" nil)
)
let((m_ind_sym m_base_lead P),
	m_ind_sym = dbOpenCellViewByType(pcCellView~>lib "ind_sym" "layout" )
	m_base_lead = dbOpenCellViewByType(pcCellView~>lib "base_lead" "layout" )
	P = W + S
	dbCreateParamInst(pcCellView m_ind_sym nil  0:0 "R0" 1 
		list(
		list("OD"     "float" OD)
	    list("W"      "float" W)
	    list("OPENING"    "float" OPENING)
	    list("LEAD"   "float" LEAD)
	    list("S"      "float" S)
	    list("NT" "int" NT)
	    list("NT_N"     "boolean" NT_N)
	    list("strName"       "string" "ind_sym_ct")
        ))

	dbCreateParamInst(pcCellView m_base_lead nil OD/2-P:-W/2 "R0" 1
                list(
                list("L"      "float" LEAD+P)    
                list("W"      "float" W)     
                list("WD"     "float" 1.0)     
                list("PINTXT" "string" "CT") 
                list("PINP" "string"   "dummy1")
                list("TOP_ME" "string" TOP_ME)
                list("BTM_ME" "string" BTM_ME)
                list("DUMMYL" "string" DUMMYL)
                list("dummy" "boolean" dummy)
	))

    rfvlsiEMVport("CT",OD/2+LEAD, -W/2,OD/2+LEAD,OPENING+W,0,8,1);

)/*end of let*/
)/*end of pcDefinePCell*/
