/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strCellName="ind_single";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD "float" 50.0) 
	(W "float" 2.0) 
	(OPENING "float" 5.0) 
	(LEAD "float" 10.0) 
	(strName "string" "ind_single")
	(NT_N "boolean" nil)
	(dummy "boolean" t)
)
let((P DUMMYL m_lead_pair m_vias m_base_ind_hud_cross m_oct m_base_oct_fill m_base_em_gr),
	DUMMYL = "RFVLSI"
	if(dummy
	then
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy5"), 0:0, sprintf(nil "%L" W), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), 0:1, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "drawing"), 0:2, strName, "centerCenter", "R0", "roman", 1)
	)

	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_oct = dbOpenCellViewByType(pcCellView~>lib "base_oct" "layout" );
	m_base_oct_fill = dbOpenCellViewByType(pcCellView~>lib "base_oct_fill" "layout" )
	m_base_em_gr = dbOpenCellViewByType(pcCellView~>lib "base_em_gr" "layout" )

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
	)	/* end of if(!NT_N */

		/* #NOT# if(evenp(NT) */
		dbCreateParamInst(pcCellView m_oct		
		nil 0:0 "R0" 1
			list(
			list("OD" "float" OD) 
			list("W" "float" W) 
			list("LOP" "float" 0.0)
			list("ROP" "float" OPENING)
			list("MET" "int" 9) 
			) /* end of parameter list */
		) /* end of dbCreateParamInst */
	
	/**** LEAD UNDER PASS ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil (OD/2):0 "R0" 1
		list(
		list("LEAD" "float" LEAD) 
		list("W" "float" W) 
		list("OPENING" "float" OPENING) 
		list("P1TXT" "string" "P1") 
		list("P2TXT" "string" "N1") 
		list("TOP_ME" "string" "9") 
		list("BTM_ME" "string" "8") 
		list("dummy" "boolean" dummy) 
		) /* end of parameter list */
	) /* end of dbCreateParamInst */

	dbCreateParamInst(pcCellView m_base_em_gr nil 0:0 "R0" 1
    list(
        list("W" "float" (OD+2*LEAD))
        list("L" "float" (OD+2*LEAD-4))
        list("LW" "float" 2.0)
        list("boundary_ext" "float" 10.0)
        list("priority" "int" 1)
    ))
	rfvlsiEMVport("P1",(OD/2+LEAD), OPENING,(OD/2+LEAD),(OPENING+W),0,8,1);
	rfvlsiEMVport("N1",(OD/2+LEAD), (-OPENING),(OD/2+LEAD),(-OPENING-W),0,8,1);
)) /* end of */
