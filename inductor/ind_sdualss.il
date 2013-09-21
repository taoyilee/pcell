/*  TYLEE PCELL
    Copyright (C) 2013  Tao-Yi Lee (tylee@ieee.org)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

strCellName="ind_sdualss";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(od_str "string" "50u") 
	(w_str "string" "2u") 
	;(OD "float" 50.0) 
	;(W "float" 2.0) 
	(SS_Gap1 "float" 3.0) 
	(SG_Gap1 "float" 4.0) 
	(SS_Gap2 "float" 5.0) 
	(SG_Gap2 "float" 6.0) 
	(LEAD "float" 10.0) 
	(NT_N "boolean" nil)
	(GND_ME "int" 3)
)
let((DUMMYL m_ind_sdual m_vias m_lead_pair OD W),
	DUMMYL = "RFVLSI"
	OD = 1M*cdfParseFloatString(od_str)
	W = 1M*cdfParseFloatString(w_str)

	m_ind_sdual = dbOpenCellViewByType(pcCellView~>lib "ind_sdual" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )

	dbCreateParamInst(pcCellView m_ind_sdual nil 0:0 "R0" 1 list(
        list("od_str"     "string" od_str)
        list("w_str"      "string" w_str)
        list("SS_Gap1"    "float" SS_Gap1)
        list("SG_Gap1"    "float" SG_Gap1)
        list("SS_Gap2"    "float" SS_Gap2)
        list("SG_Gap2"    "float" SG_Gap2)
        list("LEAD"   "float" LEAD)
        list("GND_ME" "int" GND_ME)
        list("NT_N"     "boolean" NT_N)
        list("sig1"     "boolean" t)
        list("sig2"     "boolean" t)
        list("strName" "string" "ind_sdualss")
        )
    )
	dbCreateParamInst(pcCellView m_lead_pair nil 0:4.0 "R90" 1
        list(
        list("LEAD" "float" (LEAD+OD/2-4.0))
        list("W" "float" W)
        list("OPENING" "float" (SS_Gap2/2))
        list("P1TXT" "string" "P1")
        list("N1TXT" "string" "N1")
        list("TOP_ME" "string" "9")
        list("BTM_ME" "string" "8")
        ) /* end of parameter list */
    ) /* end */
	dbCreateParamInst(pcCellView m_lead_pair nil 0:-4.0 "MYR90" 1
        list(
        list("LEAD" "float" (LEAD+OD/2-4.0))
        list("W" "float" W)
        list("OPENING" "float" (SS_Gap1/2))
        list("P1TXT" "string" "CTp")
        list("N1TXT" "string" "CTn")
        list("TOP_ME" "string" "9")
        list("BTM_ME" "string" "8")
        ) /* end of parameter list */
    ) /* end */
	
	rfvlsiEMVport("N1", (-SS_Gap2/2-W), (OD/2+LEAD), (-SS_Gap2/2), (OD/2+LEAD),0,8,2);
	rfvlsiEMVport("N2", SS_Gap2/2, (OD/2+LEAD), (SS_Gap2/2+W), (OD/2+LEAD),0,8,2);
	rfvlsiEMVport("P1", (-SS_Gap1/2-W), (-OD/2-LEAD), (-SS_Gap1/2), (-OD/2-LEAD),0,8,2);
	rfvlsiEMVport("P2", SS_Gap1/2, (-OD/2-LEAD), (SS_Gap1/2+W), (-OD/2-LEAD),0,8,2);
)) /* end of */
