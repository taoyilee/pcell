/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strCellName="ind_sym";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD "float" 50.0) 
	(W "float" 2.0) 
	(OPENING "float" 5.0) 
	(LEAD "float" 10.0) 
	(S "float" 2.0) 
	(NT "int" 2)
	(strName "string" "ind_sym")
	(NT_N "boolean" nil)
	(dummy "boolean" t)
)
let((P DUMMYL m_lead_pair m_vias m_base_ind_hud_cross m_oct m_base_oct_fill i m_base_em_gr),
	P=W+S /* Line pitch: width + space */ 
	DUMMYL = "RFVLSI"

	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )
	m_base_em_gr = dbOpenCellViewByType(pcCellView~>lib "base_em_gr" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_base_ind_hud_cross = dbOpenCellViewByType(pcCellView~>lib "base_ind_hud_cross" "layout" )
	m_oct = dbOpenCellViewByType(pcCellView~>lib "base_oct" "layout" );
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
	if(dummy
	then
		dbCreateLabel(pcCellView, list(DUMMYL, "drawing"), OD/2:0, strName, "centerCenter", "R0", "roman", 3)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy5"), 0:-1, sprintf(nil "%L" W), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy6"), 0:-3, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), 0:1, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy8"), 0:5, sprintf(nil "%L" NT), "centerCenter", "R0", "roman", 1)
	)
	
	if(!NT_N
	then
		dbCreateLabel(pcCellView, list("text", "drawing"), 0:0, "Add NT_N Manually!", "centerCenter", "R0", "roman", 3)
	)	/* end of if(!NT_N */

	if(NT>2
	then
	/* Inner L W */
		for(i 1 NT-2
			if(evenp(i)
			then
				dbCreateParamInst(pcCellView m_base_ind_hud_cross nil 0:0 "R0" 1 list(
				list("OD" "float" OD-2*i*P) 
				list("W" "float" W) 
				list("S" "float" S) 
				list("OPENING" "float" 2*W)
				list("TOP_ME" "string" "9") 
				list("BTM_ME" "string" "8") 
				list("DUMMYL" "string" "RFVLSI") 
			)) /* end of dbCreateParamInst */
			
			else
				dbCreateParamInst(pcCellView m_base_ind_hud_cross nil 0:0 "MY" 1 
					list(
					list("OD" "float" OD-2*i*P) 
					list("W" "float" W) 
					list("S" "float" S) 
					list("OPENING" "float" 2*W)
					list("TOP_ME" "string" "9") 
					list("BTM_ME" "string" "8") 
					list("DUMMYL" "string" "RFVLSI") 
					) /* end of parameter list */
				) /* end of dbCreateParamInst */
				
			) /* end of if(evenp(i) */
		) /* end of for(i 1 NT-2 */
	) /* end of if(NT>2 */
	
		dbCreateParamInst(pcCellView m_base_ind_hud_cross nil 0:0 "R0" 1 
			list(
			list("OD" "float" OD) 
			list("W" "float" W) ; Line widh
			list("S" "float" S) 
			list("OPENING" "float" OPENING)
			list("TOP_ME" "string" "9") 
			list("BTM_ME" "string" "8") 
			list("DUMMYL" "string" "RFVLSI") 
			) /* end of parameter list */
		) /* end of dbCreateParamInst */
		
	if(evenp(NT)
	then
		dbCreateParamInst(pcCellView m_base_ind_hud_cross nil 0:0 "R0" 1 
			list(
			list("OD" "float" OD-2*(NT-1)*P) 
			list("W" "float" W) 
			list("S" "float" S) 
			list("OPENING" "float" 0)
			list("TOP_ME" "string" "9") 
			list("BTM_ME" "string" "8") 
			list("DUMMYL" "string" "RFVLSI") 
			list("under" "boolean" nil) 
			) /* end of parameter list */
		) /* end of dbCreateParamInst */
	else
		/* #NOT# if(evenp(NT) */
		dbCreateParamInst(pcCellView m_oct		
		nil 0:0 "R0" 1
			list(
			list("OD" "float" OD-2*(NT-1)*P) 
			list("W" "float" W) 
			list("LOP" "float" 0.0)
			list("ROP" "float" 2*W)
			list("MET" "int" 9) 
			) /* end of parameter list */
		) /* end of dbCreateParamInst */
	) /* end of if(evenp(NT) */
	
	/**** LEAD UNDER PASS ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil OD/2:0 "R0" 1
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
        list("W" "float" (OD+LEAD))
        list("L" "float" (OD+2*LEAD-4))
        list("LW" "float" 2.0)
        list("boundary_ext" "float" 10.0)
        list("priority" "int" 1)
    ))

	rfvlsiEMVport("P1",OD/2+LEAD, OPENING,OD/2+LEAD,OPENING+W,0,8,1);
	rfvlsiEMVport("N1",OD/2+LEAD, -OPENING,OD/2+LEAD,-OPENING-W,0,8,1);
)) /* end of */
