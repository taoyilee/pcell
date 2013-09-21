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
	
strCellName="base_xfm_half";	
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 200.0)  ; Inductor total width
	(WO	"float" 5.0)	; Line width
	(WI	"float" 5.0)	; Line width
	(S	"float"	2.0) 
	(B_TK	"float"	0.0) 
	(A_TK	"float"	0.0) 
	(LOP "float"	15.0) 
	(ROP "float"	15.0) 
	(TOP_ME "int"	9) 
	(BTM_ME "int"	9) 
	(via_to_next "boolean"	nil) 
	(via_diag "boolean"	nil) 
)
let((P C A B BA BB PA PB pi m_base_oct_half i m_vias ),
	pi = 3.141592
	P = S+WO
	C = ceiltogrid(WO*tan(pi/8)+0.005)
	DIV = 2 + sqrt(2)
	A = roundtogrid(OD/DIV)-A_TK
	B = OD-2*A-B_TK
	BA = floortogrid(B/2 - 0.005)
	BB = B-BA
	PA = roundtogrid(P/2)
	PB = P-PA
	m_base_oct_half = dbOpenCellViewByType(pcCellView~>lib "base_oct_half" "layout")
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	m_viasd = dbOpenCellViewByType(pcCellView~>lib "vias_diagonal" "layout")
	
	for(i BTM_ME TOP_ME
		dbCreateParamInst(pcCellView m_base_oct_half nil 0:0 "R0" 1
		list(
			list("OD"  "float" OD)
			list("W"    "float" WO)
			list("LOP"    "float" LOP)
			list("ROP"    "float" ROP)
			list("A_TK"    "float" A_TK)
			list("B_TK"    "float" B_TK)
			list("MET"   "int"   i)
		))
	)

	if(via_to_next
	then
		dbCreateParamInst(pcCellView m_vias nil A-OD/2:BA+A-WO "R0" 1
			list(
			list("Length"  "float" WO)
			list("Width"    "float" B)
			list("TOP_ME"   "int"   TOP_ME)
			list("BTM_ME"   "int"   BTM_ME)
		)) 
	)

	if(via_diag
	then
		dbCreateParamInst(pcCellView m_viasd
		nil (-OD/2):BA "R0" 1
		list(
			list("Length"  "float" (A-C-WO))
			list("Width"    "float" (WO+C))
			list("TOP_ME"   "int"   TOP_ME)
			list("BTM_ME"   "int"   BTM_ME)
		)) ; close dbCreateParamInst

		dbCreateParamInst(pcCellView m_viasd nil (OD/2):BA "MY" 1
		list(
				list("Length"  "float" (A-C-WO))
				list("Width"    "float" (WO+C))
				list("TOP_ME"   "int"   TOP_ME)
				list("BTM_ME"   "int"   BTM_ME)
		)) ; close dbCreateParamInst
	)
))
