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
	
strCellName="base_balun_half"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 150.0)
	(WO	"float" 7.0)
	(WI	"float" 4.0)
	(W_INC	"float" 1.5)
	(S	"float"	2.0) 
	(B_TK	"float"	0.0) 
	(A_TK	"float"	0.0) 
	(LOP "float"	10.0) 
	(ROP "float"	10.0) 
	(en_dmy "boolean"	t) 
	(en_NTN "boolean"	t) 
	(en_HighK "boolean"	t) 
	(align_left "boolean"	t) 
)

let((pi P WW C CI A B BA BB PA PB CA CB DIV m_base_xfm_half m_base_oct_half_fill m_vias),
	pi=3.141592
	P = S+WO
	WW = WO + W_INC
	C = ceiltogrid(WO*tan(pi/8)+0.005)
	CA = roundtogrid(C/2)
	CB = C - CA
	CI = roundtogrid(WW*tan(pi/8))-C
	DIV = 2+sqrt(2)
	A = roundtogrid(OD/DIV)-A_TK
	B = OD-2*A-B_TK
	BA = floortogrid(B/2-0.005)
	BB = B-BA
	PA = roundtogrid(P/2)
	PB = P-PA
	m_base_xfm_half = dbOpenCellViewByType(pcCellView~>lib "base_xfm_half" "layout" )
	m_base_oct_half_fill = dbOpenCellViewByType(pcCellView~>lib "base_oct_half_fill" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )

 dbCreateParamInst(pcCellView
		m_base_xfm_half
        nil 0:0 "R0" 1
        list(
            list("OD"     "float" OD)
            list("WO"      "float" WO)
            list("WI"      "float" WI)
            list("S"      "float" S)
            list("B_TK"   "float" B_TK)
            list("A_TK"   "float" A_TK)
            list("TOP_ME" "int"    9)
            list("BTM_ME" "int"    8)
            list("en_dmy" "boolean"   en_dmy)
            list("via_to_next" "boolean"  t)
            list("via_diag" "boolean"   t)
            list("ROP" "float" ROP)
            list("LOP" "float" LOP))
        )

	if(!en_NTN
	then
		dbCreateLabel(pcCellView, list("text","drawing"), OD/2:(-3), "Add en_NTN Manually!", "centerCenter", "R0", "roman", 2)
	else
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "NT_N")
            list("purp" "string"  "drawing")))
	)

	if(en_dmy
	then
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI")
            list("purp" "string"  "drawing")))
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI_LVS")
            list("purp" "string"  "dummy8")))
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "RFVLSI")
            list("purp" "string"  "dummy9")))
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "DMEXCL")
            list("purp" "string"  "dummy8")))
		dbCreateParamInst(pcCellView m_base_oct_half_fill nil 0:0 "R0" 1 list(
            list("OD"     "float" OD)
            list("layer" "string"   "DMEXCL")
            list("purp" "string"  "dummy9")))
	)

	if(BA > ROP
	then
        dbCreateParamInst(pcCellView m_vias nil (OD/2-WO:ROP) "R0" 1
    	    list(
                list("Length"  "float" (BA-ROP))
                list("Width"    "float" WO)
                list("TOP_ME"   "int"   9)
                list("BTM_ME"   "int"   8))) ; close dbCreateParamInst
	)
	if(BA > (LOP + WI + 2*S)
	then

		dbCreateParamInst(pcCellView m_vias	nil (-OD/2):LOP "R0" 1
	        list(
                list("Length"  "float" (BA-LOP-2*S-WI))
                list("Width"    "float" WO)
                list("TOP_ME"   "int"   9)
                list("BTM_ME"   "int"   8))
		) ; close dbCreateParamInst
	)

)/*end of let*/
)/*end of pcDefinePCell*/
