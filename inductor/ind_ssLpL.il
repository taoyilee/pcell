/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strCellName="ind_ssLpL";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(od1_str "string" "50u") 
	(w1_str "string" "2u") 
	(od2_str "string" "50u") 
	(w2_str "string" "2u") 
	(SS_Gap "float" 5.0) 
	(SG_Gap "float" 5.0) 
	(OP2 "float" 5.0) 
	(LEAD "float" 10.0) 
	(SY "float" 10.0) 
	(NT "int" 2)
	(strName "string" "ind_dualp")
	(NT_N "boolean" nil)
	(GND_ME "int" 3)
)
let((m_ind_dualpp m_ind_dualss OD1 OD2 W1 W2),
	OD1 = 1M*cdfParseFloatString(od1_str)
	OD2 = 1M*cdfParseFloatString(od2_str)
	m_ind_dualpp = dbOpenCellViewByType(pcCellView~>lib "ind_sdualpp" "layout" )
	m_ind_dualss = dbOpenCellViewByType(pcCellView~>lib "ind_sdualss" "layout" )

    dbCreateParamInst(pcCellView m_ind_dualpp nil 0:0 "R0" 1 list(
		list("od_str"     "string" od1_str)
        list("w_str"      "string" w1_str)
        list("SS_Gap1"    "float" SS_Gap)
        list("SG_Gap1"    "float" SG_Gap)
        list("SS_Gap2"    "float" SS_Gap)
        list("SG_Gap2"    "float" SG_Gap)
        list("LEAD"   "float" (SY/2))
        list("NT_N"     "boolean" NT_N)
        list("GND_ME" "int" GND_ME)
		list("OP2" "float" OP2)
		)
	)
	dbCreateParamInst(pcCellView m_ind_dualss nil 0:(OD1/2+OD2/2+SY) "R0" 1 list(
        list("od_str"     "string" od2_str)
        list("w_str"      "string" w2_str)
        list("SS_Gap1"    "float" SS_Gap)
        list("SG_Gap1"    "float" SG_Gap)
        list("SS_Gap2"    "float" SS_Gap)
        list("SG_Gap2"    "float" SG_Gap)
        list("LEAD"   "float" (SY/2))
        list("NT_N"     "boolean" NT_N)
        list("GND_ME" "int" GND_ME)
        list("OP2" "float" OP2)
        )
    )

)) /* end of */
