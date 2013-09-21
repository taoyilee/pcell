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
strCellName="base_ind_hud_cross";
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 60.0)
	(W 	"float" 2.0)
	(S 	"float" 2.0)
	(OPENING "float" 10.0)
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	(under "boolean" t)
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
)

let((P via_to_next C C2 pi OO OOC OOCH m_base_oct),
	P=W+S
	if(atoi(TOP_ME) - atoi(BTM_ME) <2
	then
		via_to_next = nil
	)
	pi = 3.141592
	C=roundtogrid(W*tan(pi/8))
	C2=roundtogrid(C/sqrt(2))
	OO = 2*W+S
	OOC = 2*W+S-2*C2
	OOCH = OOC/2
	
	m_base_oct = dbOpenCellViewByType(pcCellView~>lib "base_oct" "layout" );
	dbCreateParamInst(pcCellView m_base_oct
			nil 0:0 "R0" 1
			list(
			list("OD" "float" OD) 
			list("W" "float" W) 
			list("LOP" "float" OOCH + roundtogrid(2*sqrt(2.0)- S)+0.01)
			list("ROP" "float" OPENING) 
			list("MET" "int" 9) 
		)) ; close dbCreateParamInst

	if(under
	then
		dbCreateParamInst(pcCellView
			dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout") nil (-OD/2):0 "R0" 1
			list(
				list("WI" "float" S) 				
				list("WO" "float" W) 				
				list("S" "float" 0.0) 
				list("TOP_ME" "int" atoi(TOP_ME)) 
				list("BTM_ME" "int" atoi(TOP_ME)-1) 
				list("dummy" "boolean" dummy) 
				)) ; close dbCreateParamInst
		dbCreateParamInst(pcCellView
			dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout") nil (-OD/2+P+W):0 "MY" 1
			list(
				list("WI" "float" S) 				
				list("WO" "float" W) 				
				list("S" "float" 0.0) 
				list("TOP_ME" "int" atoi(TOP_ME)) 
				list("BTM_ME" "int" atoi(TOP_ME)) 
				list("viat" "boolean" nil) 
				list("viad" "boolean" nil) 				
				list("dummy" "boolean" dummy) 
				)) ; close dbCreateParamInst
		)
))
