/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strCellName="ind_dualpp";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	;(OD_STR "string" "50u") 
	;(W_STR "string" "2u") 
	(OD "float" 50.0) 
	(W "float" 2.0) 
	(SS_Gap "float" 5.0) 
	(SG_Gap "float" 5.0) 
	(OP2 "float" 5.0) 
	(LEAD "float" 10.0) 
	(S "float" 2.0) 
	(NT "int" 2)
	(strName "string" "ind_dualpp")
	(NT_N "boolean" nil)
	(GND_ME "int" 3)
)
let((P DUMMYL m_ind_dual m_vias m_lead_pair m_under),
	P=W+S /* Line pitch: width + space */ 
	DUMMYL = "RFVLSI"

	m_ind_dual = dbOpenCellViewByType(pcCellView~>lib "ind_dual" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )
	m_under = dbOpenCellViewByType(pcCellView~>lib "base_under" "layout" )

	dbCreateParamInst(pcCellView m_ind_dual nil 0:0 "R0" 1 list(
        list("OD"     "float" OD)
        list("W"      "float" W)
        list("S"      "float" S)
        list("SS_Gap1"    "float" SS_Gap)
        list("SG_Gap1"    "float" SG_Gap)
        list("SS_Gap2"    "float" SS_Gap)
        list("SG_Gap2"    "float" SG_Gap)
        list("LEAD"   "float" LEAD)
        list("NT" "int" NT)
        list("GND_ME" "int" GND_ME)
        list("NT_N"     "boolean" NT_N)
        list("OP2"     "float" OP2)
        list("strName" "string" strName)
        list("sig1"     "boolean" t)
        list("sig2"     "boolean" nil)
        )
    )
	dbCreateRect(pcCellView, list("RFVLSI", "dummy1"),	list(-W/2:4 W/2:4+W ))
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy1"), 0:4+W/2, "CT8", "centerCenter", "R90", "roman", 0.5)

	dbCreateParamInst(pcCellView m_under nil (-SS_Gap/2-2*W-SG_Gap):(4.0+W) "MX" 1
        list(
        list("L" "float" (SS_Gap+2*SG_Gap+4*W))
        list("W" "float" W)
        list("TOP_ME" "int" 9)
        list("BTM_ME" "int" 8)
        ) /* end of parameter list */
    ) /* end */

	dbCreateParamInst(pcCellView m_lead_pair nil 0:4.0 "R90" 1
        list(
        list("LEAD" "float" (LEAD+OD/2-4.0))
        list("W" "float" W)
        list("OPENING" "float" (SS_Gap/2))
        list("P1TXT" "string" "P1")
        list("N1TXT" "string" "N1")
        list("TOP_ME" "string" "9")
        list("BTM_ME" "string" "8")
        ) /* end of parameter list */
    ) /* end */

	dbCreateParamInst(pcCellView m_lead_pair nil 0:4.0 "MYR90" 1
        list(
        list("LEAD" "float" (LEAD+OD/2+4.0))
        list("W" "float" W)
        list("OPENING" "float" (SS_Gap/2))
        list("TOP_ME" "string" "9")
        list("dummy" "boolean" nil)
        list("BTM_ME" "string" "8")
        ) /* end of parameter list */
    ) /* end */

	
	rfvlsiEMVport("N1", (-SS_Gap/2-W), (OD/2+LEAD), (-SS_Gap/2), (OD/2+LEAD),0,8,2);
	rfvlsiEMVport("P1", (-SS_Gap/2-W), (-OD/2-LEAD), (-SS_Gap/2), (-OD/2-LEAD),0,8,2);
)) /* end of */
