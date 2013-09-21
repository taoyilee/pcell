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

	
strCellName="base_diag";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W 	"float" 2.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(OP	"float"	20.0) ; Line spacing
	(MET	"int"	9) ; Line spacing
)
let((pi  C C2 X_max ),
	pi=3.141592
	X_max = S+2*W
	C = ceiltogrid(W*tan(pi/8)+0.005)
	C2 = roundtogrid(C/2)
	diag_y = (X_max - W)
	stra_y1 = roundtogrid((OP-diag_y)/2)
	stra_y2 = OP - stra_y1-diag_y
		dbCreatePolygon(pcCellView, MetalVec(MET-1),
			list(
				0:0 W:0
				W:stra_y1-C2 
				X_max:OP-stra_y2-C2
				X_max:OP
				diag_y:OP
				diag_y:stra_y1+C2+diag_y  
				0:stra_y1+C2
			))
))
