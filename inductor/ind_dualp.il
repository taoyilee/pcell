/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strCellName="ind_dualp";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD "float" 50.0) 
	(W "float" 2.0) 
	(SG_Gap1 "float" 3.0) 
	(SG_Gap2 "float" 3.0) 
	(OP2 "float" 5.0) 
	(LEAD "float" 10.0) 
	(S "float" 2.0) 
	(NT "int" 2)
	(strName "string" "ind_dualp")
	(NT_N "boolean" nil)
	(GND_ME "int" 3)
)
let((DUMMYL m_ind_dual m_vias m_lead_pair m_lead ),
	DUMMYL = "RFVLSI"

	m_ind_dual = dbOpenCellViewByType(pcCellView~>lib "ind_dual" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )
	m_lead = dbOpenCellViewByType(pcCellView~>lib "base_lead" "layout" )

    dbCreateParamInst(pcCellView m_ind_dual nil 0:0 "R0" 1 list(
		list("OD"     "float" OD)
        list("W"      "float" W)
        list("SS_Gap1"    "float" 0.0)
        list("SG_Gap1"    "float" SG_Gap1)
        list("SS_Gap2"    "float" 0.0)
        list("SG_Gap2"    "float" SG_Gap2)
        list("LEAD"   "float" LEAD)
        list("S"      "float" S)
        list("NT" "int" NT)
        list("NT_N"     "boolean" NT_N)
        list("gnd1"     "boolean" t)
        list("short1"     "boolean" nil)
        list("short2"     "boolean" t)
        list("GND_ME" "int" GND_ME)
		list("strName" "string" strName)
		list("OP2" "float" OP2)
		)
	)
;	dbCreateRect(pcCellView MetalVec(8) list(-W/2:4.0 W/2:(-OD/2-LEAD)))
	dbCreateRect(pcCellView list("RFVLSI_LVS" "dummy9") list(-W/2:4.0 W/2:-4))
    dbCreateParamInst(pcCellView m_lead nil W/2:0.0 "MYR90" 1
        list(
        list("L" "float" (LEAD+OD/2))
        list("W" "float" W)
        list("PINTXT" "string" "P1")
        list("TOP_ME" "string" "9")
        list("BTM_ME" "string" "9")
        ) /* end of parameter list */
    ) /* end */
    dbCreateParamInst(pcCellView m_lead nil W/2:0.0 "R90" 1
        list(
        list("L" "float" (LEAD+OD/2))
        list("W" "float" W)
        list("PINTXT" "string" "N1")
        list("TOP_ME" "string" "9")
        list("BTM_ME" "string" "9")
        ) /* end of parameter list */
    ) /* end */
	
	rfvlsiEMVport("P1", (-W/2), (OD/2+LEAD), W/2, (OD/2+LEAD),0,8,3);
)) /* end of */
