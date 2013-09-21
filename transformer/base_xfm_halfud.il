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
	
strCellName="base_xfm_halfud"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0) ; Inductor total width
	(W	"float" 4.0)	
	(S	"float"	5.0) 
	(B_TK	"float"	0.0) 
	(A_TK	"float"	0.0) 
	(LOP "float" 5.0) 
	(ROP "float"	 10.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(en_dmy "boolean"	t) 
	(TOP_ME "string"	"9") 
	(BTM_ME "string"	"9") 
	(via_to_next "boolean"	nil) 
	(via_diag "boolean"	nil) 
)
let((mhalf),
	mhalf = dbOpenCellViewByType(pcCellView~>lib "base_xfm_half" "layout" ) 
	dbCreateParamInst(pcCellView mhalf nil 0:0 "R0" 1 
		list(
		list("OD" "float" OD)
		list("W" "float" W) 
		list("S" "float" S) 
		list("B_TK" "float" B_TK) 
		list("A_TK" "float" A_TK) 
		list("TOP_ME" "string" TOP_ME) 
		list("BTM_ME" "string" BTM_ME) 
		list("en_dmy" "boolean" en_dmy) 
		list("via_to_next" "boolean"	via_to_next)
		list("via_diag" "boolean"	via_diag)
		list("ROP" "float" ROP+LEADDYO)
		list("LOP" "float" LOP+LEADDYI))
	)
	dbCreateParamInst(pcCellView mhalf nil 0:0 "MX" 1 
		list(
		list("OD" "float" OD)
		list("W" "float" W) 
		list("S" "float" S) 
		list("B_TK" "float" B_TK) 
		list("A_TK" "float" A_TK) 
		list("TOP_ME" "string" TOP_ME) 
		list("BTM_ME" "string" BTM_ME) 
		list("en_dmy" "boolean" en_dmy) 
		list("via_to_next" "boolean"	via_to_next)
		list("via_diag" "boolean"	via_diag)
		list("ROP" "float" ROP-LEADDYO)
		list("LOP" "float" LOP-LEADDYI)
	))
))
