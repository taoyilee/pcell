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

	
strCellName="base_d";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W 	"float" 2.0)	; Line width
	(STA	"float" 3.0) ; Line spacing
	(DIAG	"float"	3.0) ; Line spacing
	(MET	"int"	9) ; Line spacing
)
let((pi C C2 X_max W2),
	pi=3.141592
	W2 = roundtogrid(W/sqrt(2))
	C = roundtogrid(W*tan(pi/8))
		dbCreatePolygon(pcCellView, MetalVec(MET-1),
			list(
				DIAG+W2:DIAG+STA+C-W2
				DIAG:DIAG+STA+C
				0:STA+C
				0:0 W:0
				W:STA
			))
))
