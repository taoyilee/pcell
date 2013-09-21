/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strCellName="ind_sLpL";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD1 "float" 50.0) 
	(OD2 "float" 50.0) 
	(W "float" 2.0) 
	(SS_Gap "float" 5.0) 
	(SG_Gap "float" 5.0) 
	(OP2 "float" 5.0) 
	(LEAD "float" 10.0) 
	(S "float" 2.0) 
	(SY "float" 10.0) 
	(NT "int" 2)
	(strName "string" "ind_dualp")
	(NT_N "boolean" nil)
	(GND_ME "int" 3)
)
let((m_ind_dualpp m_ind_dualss),
	m_ind_dualpp = dbOpenCellViewByType(pcCellView~>lib "ind_dualpp" "layout" )
	m_ind_dualss = dbOpenCellViewByType(pcCellView~>lib "ind_dualss" "layout" )

    dbCreateParamInst(pcCellView m_ind_dualpp nil 0:0 "R0" 1 list(
		list("OD"     "float" OD1)
        list("W"      "float" W)
        list("SS_Gap1"    "float" SS_Gap)
        list("SG_Gap1"    "float" SG_Gap)
        list("SS_Gap2"    "float" SS_Gap)
        list("SG_Gap2"    "float" SG_Gap)
        list("LEAD"   "float" (SY/2))
        list("S"      "float" S)
        list("NT" "int" NT)
        list("NT_N"     "boolean" NT_N)
        list("GND_ME" "int" GND_ME)
		list("OP2" "float" OP2)
		)
	)
	dbCreateParamInst(pcCellView m_ind_dualss nil 0:(OD1/2+OD2/2+SY) "R0" 1 list(
        list("OD"     "float" OD2)
        list("W"      "float" W)
        list("SS_Gap1"    "float" SS_Gap)
        list("SG_Gap1"    "float" SG_Gap)
        list("SS_Gap2"    "float" SS_Gap)
        list("SG_Gap2"    "float" SG_Gap)
        list("LEAD"   "float" (SY/2))
        list("S"      "float" S)
        list("NT" "int" NT)
        list("NT_N"     "boolean" NT_N)
        list("GND_ME" "int" GND_ME)
        list("OP2" "float" OP2)
        )
    )

	;rfvlsiEMVport("P1", (-SS_Gap-W), (-OD/2-LEAD), (-SS_Gap), (-OD/2-LEAD),0,8,2);
	;rfvlsiEMVport("N1", SS_Gap, (-OD/2-LEAD), (SS_Gap+W), (-OD/2-LEAD),0,8,2);
)) /* end of */
