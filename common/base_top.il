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

strCellName="base_top";	Cell Name

; Define my parameterized cell with the information above
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(L 	"float" 	10.0)	; Inductor total width
	(W  	"float"		8.0)	; Line width
	(TOP_ME "int"		10)
	(BTM_ME	"int"		9)
	(dummy	"boolean"	t)
	(vias	"boolean"	t)
	(top	"boolean"	t)	; use top layer instead of bottom
)
let((masterVIAS),
	/*	draw vias	*/
	masterVIAS= dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
		dbCreateParamInst(pcCellView masterVIAS nil 0:0 "R0" 1
		list(
			list("Length" "float"    W)
			list("Width" "float"   W)
			list("TOP_ME" "float" TOP_ME)
			list("BTM_ME" "float" BTM_ME)
        	)) ; close dbCreateParamInst	
	
		dbCreateParamInst(pcCellView masterVIAS nil L-W:0 "R0" 1
		list(
			list("Length" "float"    W)
			list("Width" "float"   W)
			list("TOP_ME" "float" TOP_ME)
			list("BTM_ME" "float" BTM_ME)
	        )) ; close dbCreateParamInst	
	/*	enf of draw vias	*/

		dbCreateRect(pcCellView, MetalVec(TOP_ME-1),list(0:0   L-W:W))	
		dbCreateRect(pcCellView, list("RFVLSI","drawing"),list(0:0 L:W))   
))

