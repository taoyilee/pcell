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

pcDefinePCell(list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 30.0)
	(Width "float"   2.5)
	(TOP_ME   "int" 7)
	(BTM_ME   "int" 6)
)
let((),
	if(Length>Width
	then
	dbCreateParamInst(pcCellView
		dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
		nil  -Width/2:0 "R0" 1
                list(
                        list("Length"     "float"    Width)   ; Line width
                        list("Width"     "float"     Width)   ; Line width
                        list("BTM_ME"  "int"    BTM_ME) ; Turns
                        list("TOP_ME"   "int"   TOP_ME) ; Turns
                ))
	)
	dbCreatePath(pcCellView MetalVec(TOP_ME-1)  list(0:0 0:Length) Width "truncateExtend")
	dbCreatePath(pcCellView MetalVec(BTM_ME-1)  list(0:0 0:Length) Width "truncateExtend")
)/*end of let*/
)/*end of pcDefinePCell*/
