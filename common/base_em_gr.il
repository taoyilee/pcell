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


strCellName="base_em_gr";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W "float" 100.0) 
	(L "float" 100.0) 
	(LW "float" 5.0) 
	(boundary_ext "float" 10.0) 
	(priority "int" 10)
)
let((m_base_em_bc masterVias),
	m_base_em_bc = dbOpenCellViewByType(pcCellView~>lib "base_em_bc" "layout" )
	masterVias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout");

	dbCreateParamInst(pcCellView m_base_em_bc nil 0:0 "R0" 1
    list(
        list("W" "float" W)
        list("L" "float" L)
        list("LW" "float" LW)
        list("boundary_ext" "float" boundary_ext)
        list("priority" "int" priority)
    ))

masterVias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout");

rfvlsiEMDummyCreateParamInst(pcCellView masterVias nil (-W/2):(-L/2) "R0" 1
	list(
	list("Width"  "float" LW)  
	list("Length"  "float" L)
	list("TOP_ME"  "int" 1) 
	list("BTM_ME"  "int" 1)
	) ,priority)
rfvlsiEMDummyCreateParamInst(pcCellView masterVias nil (W/2):(-L/2) "MY" 1
	list(
	list("Width"  "float" LW)  
	list("Length"  "float" L)
	list("TOP_ME"  "int" 1) 
	list("BTM_ME"  "int" 1)
	) ,priority)
rfvlsiEMDummyCreateParamInst(pcCellView masterVias nil (-W/2):(-L/2) "R0" 1
	list(
	list("Width"  "float" W)  
	list("Length"  "float" LW)
	list("TOP_ME"  "int" 1) 
	list("BTM_ME"  "int" 1)
	) ,priority)
rfvlsiEMDummyCreateParamInst(pcCellView masterVias nil (-W/2):(L/2) "MX" 1
	list(
	list("Width"  "float" W)  
	list("Length"  "float" LW)
	list("TOP_ME"  "int" 1) 
	list("BTM_ME"  "int" 1)
	) ,priority) 

)) /* end of */
