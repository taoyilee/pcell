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

strCellName="base_ind_sym_cct4T_t";
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)
	(W 	"float" 2.0)
	(S 	"float" 2.0)
	(OPENING "float" 10.0)
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	(under "boolean" t)
	(dummy "boolean" t)
)
	let((P via_to_next master_cross),
		P=W+S
		master_cross = dbOpenCellViewByType(pcCellView~>lib "base_xfm_cross" "layout")
		dbCreateParamInst(pcCellView 
			dbOpenCellViewByType(pcCellView~>lib "base_oct" "layout" )
			nil 0:0 "R0" 1
			list(
			list("OD" "float" OD) 
			list("W" "float" W) 
			list("S" "float" S) 
			list("LOP" "float" S+W/1.5)
			list("ROP" "float" OPENING) 
			)
		) 
		
		if(under
		then
			dbCreateParamInst(pcCellView master_cross nil -OD/2:0 "R0" 1
				list(
				list("WI" "float" S) 
				list("WO" "float" W) 
				list("S" "float" 0.0) 
				list("TOP_ME" "int" atoi(TOP_ME)) 
				list("BTM_ME" "int" atoi(TOP_ME)-1) 
				list("dummy" "boolean" dummy) 
				)
			) 			
			dbCreateParamInst(pcCellView master_cross	 nil -OD/2+P+W:0 "MY" 1
				list(
				list("WI" "float" S) 
				list("WO" "float" W) 
				list("S" "float" 0.0) 
				list("TOP_ME" "int" atoi(TOP_ME)) 
				list("viat" "boolean" nil) 
				list("viad" "boolean" nil) 
				list("BTM_ME" "int" atoi(TOP_ME)) 
				list("dummy" "boolean" dummy) 
				)
			) 
		)
	)
)
