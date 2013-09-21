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

strCellName="underR45";	  /*Assign your cell name to variable strCellName*/
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Width "float"   5.0)
	(Length "float"  5.0)
	(TOP_ME	  "int" 2)
	(BTM_ME   "int" 1)
)
let((W master_vt),
    master_vt = dbOpenCellViewByType(pcCellView~>lib "vias_R45" "layout")

    dbCreateParamInst(pcCellView master_vt
                nil 0:0 "R0" 1
                list(
                list("Width" "float" Width)
                list("TOP_ME" "int" TOP_ME)
                list("BTM_ME" "int" BTM_ME)
                ) ; close list
                ) ; close dbCreateParamInst


	dbCreateParamInst(pcCellView master_vt
                nil Length:Length "R0" 1
                list(
                list("Width" "float" Width)
                list("TOP_ME" "int" TOP_ME)
                list("BTM_ME" "int" BTM_ME)
                ) ; close list
                ) ; close dbCreateParamInst
	
	dbCreatePolygon(pcCellView, MetalVec(BTM_ME-1),
		list(Width/2:Width/2 Width:0 Length+Width:Length
			Length+Width/2:Length+Width/2))
	
)/*end of let*/
)/*end of pcDefinePCell*/
