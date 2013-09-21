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

strCellName="base_ind_sym_cct_t";
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 60.0)
	(W  	"float" 3.0)
	(S  	"float" 3.0)
	(OPENING  "float" 10.0)
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	(under "boolean" t)
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
)

let((P via_to_next pi C C2 OO OOC OOCH OOCHD),
	P=W+S	; Line pitch: width + space
	if(atoi(TOP_ME) - atoi(BTM_ME) <2
	then
		via_to_next = nil
	)
	
	pi = 3.141592
	C = roundtogrid(W*tan(pi/8))
	C2 = roundtogrid(C/sqrt(2))
    OO = 2*W+S
    OOC = 2*W+S-2*C2
    OOCH = OOC/2
    if(S <=2.0*sqrt(2)
    then
        OOCHD = OOCH + roundtogrid(2*sqrt(2.0)- S)+0.01
    else
        OOCHD = OOCH
    )
	
	dbCreateParamInst(pcCellView 
	dbOpenCellViewByType(pcCellView~>lib "base_xfm_halfud" "layout" );
		nil  -OD/2:0 "R0" 1
		list(
		list("OD"     "float" OD)  ; Inductor total width
		list("W"      "float" W)    ; Line width
		list("S"      "float" S) 
		list("LOP" "float" OOCHD)
		list("ROP" "float"     OPENING) 
		list("TOP_ME" "string"    TOP_ME) 
		list("BTM_ME" "string"    BTM_ME) 
		list("DUMMYL" "string"  "RFVLSI") 
		list("dummy" "boolean"   dummy) 
		list("via_to_next" "boolean"	via_to_next)
		list("via_diag" "boolean"	via_to_next)
	)) ; close dbCreateParamInst
	if(under
	then
		dbCreateParamInst(pcCellView
			dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout") nil  -OD/2:0 "R0" 1
			list(
				list("WI"      "float" S)    ; Line width
				list("WO"      "float" W) 
				list("S"      "float"  0.0) 
				list("TOP_ME" "int"    atoi(TOP_ME)) 
				list("BTM_ME" "int"    atoi(TOP_ME)-1) 
				list("dummy" "boolean"   dummy) 
				)) ; close dbCreateParamInst
		dbCreateParamInst(pcCellView
			dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout") nil  -OD/2+P+W:0 "MY" 1
			list(
				list("WI"      "float" S)    ; Line width
				list("WO"      "float" W) 
				list("S"      "float"  0.0) 
				list("TOP_ME" "int"    atoi(TOP_ME)) 
				list("viat" "boolean"  nil) 
				list("viad" "boolean"  nil) 
				list("BTM_ME" "int"    atoi(TOP_ME)) 
				list("dummy" "boolean"   dummy) 
				)) ; close dbCreateParamInst
		)
))
