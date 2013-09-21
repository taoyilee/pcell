/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strCellName="ind_sdualpp";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(od_str "string" "50u") 
	(w_str "string" "2u") 
	(SS_Gap "float" 5.0) 
	(SG_Gap "float" 5.0) 
	(LEAD "float" 10.0) 
	(NT_N "boolean" nil)
	(GND_ME "int" 3)
)
let(( m_ind_sdual m_vias m_lead_pair m_under OD W),
	m_ind_sdual = dbOpenCellViewByType(pcCellView~>lib "ind_sdual" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )
	m_under = dbOpenCellViewByType(pcCellView~>lib "base_under" "layout" )
	OD = 1M*cdfParseFloatString(od_str)
	W = 1M*cdfParseFloatString(w_str)

	dbCreateRect(pcCellView, list("RFVLSI", "dummy1"),	list(-W/2:4 W/2:4+W ))
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy1"), 0:4+W/2, "CT8", "centerCenter", "R90", "roman", 0.5)

	dbCreateParamInst(pcCellView m_ind_sdual nil 0:0 "R0" 1 list(
        list("od_str"     "string" od_str)
        list("w_str"      "string" w_str)
        list("SS_Gap1"    "float" SS_Gap)
        list("SG_Gap1"    "float" SG_Gap)
        list("SS_Gap2"    "float" SS_Gap)
        list("SG_Gap2"    "float" SG_Gap)
        list("LEAD"   "float" LEAD)
        list("GND_ME" "int" GND_ME)
        list("NT_N"     "boolean" NT_N)
        list("strName" "string" "ind_sdualpp")
        list("sig1"     "boolean" t)
        list("sig2"     "boolean" nil)
        )
    )

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
        list("dummy" "boolean" nil)
        list("OPENING" "float" (SS_Gap/2))
        list("TOP_ME" "string" "9")
        list("BTM_ME" "string" "8")
        ) /* end of parameter list */
    ) /* end */
	rfvlsiEMVport("N1", (-SS_Gap/2-W), (OD/2+LEAD), (-SS_Gap/2), (OD/2+LEAD),0,8,2);
	rfvlsiEMVport("P1", (-SS_Gap/2-W), (-OD/2-LEAD), (-SS_Gap/2), (-OD/2-LEAD),0,8,2);
)) /* end of */
