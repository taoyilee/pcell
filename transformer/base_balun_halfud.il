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
	
strCellName="base_balun_halfud"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)  ; Inductor total width
	(W	"float" 4.0)	
	(W_INC	"float" 1.5)	
	(S	"float"	5.0) 
	(LOP "float" 10.0) 
	(ROP "float"	 10.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(en_dmy "boolean"	t) 
	(en_HighK "boolean"	t)
	(align_left "boolean"	t) 
)
let((),

	dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "base_balun_half" "layout" ) nil 0:0 "R0" 1 
		list(
      		list("OD"     "float" OD)
        	list("W"      "float" W)    
        	list("W_INC"      "float" W_INC)    
        	list("S"      "float" S) 
        	list("en_dmy" "boolean"   en_dmy) 
			list("en_HighK" "boolean"   en_HighK) 
			list("align_left" "boolean" align_left)
			list("ROP" "float" ROP+LEADDYO)
			list("LOP" "float" LOP+LEADDYI))
		)
	dbCreateParamInst(pcCellView dbOpenCellViewByType(pcCellView~>lib "base_balun_half" "layout" ) nil 0:0 "MX" 1 
		list(
      		list("OD"     "float" OD)
        	list("W"      "float" W)    
        	list("W_INC"      "float" W_INC)    
        	list("S"      "float" S) 
        	list("en_dmy" "boolean"   en_dmy) 
			list("en_HighK" "boolean"   en_HighK) 
			list("align_left" "boolean" align_left)
			list("ROP" "float" ROP-LEADDYO)
			list("LOP" "float" LOP-LEADDYI))
	)

)/*end of let*/
)/*end of pcDefinePCell*/

