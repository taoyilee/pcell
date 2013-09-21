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

	
strCellName="base_oct_quad_fill";	

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 200.0)  ; Inductor total width
	(W	"float" 5.0)	; Line width
	(OP "float"	0.0) 
	(MET "int"	9) 
	(layer "string"	"RFVLSI") 
	(purp "string"	"drawing") 
)
let((pi C A B BA BB DIV),
	pi = 3.141592
	C = ceiltogrid(W*tan(pi/8)+0.005)
	DIV = 2+sqrt(2)
	A = roundtogrid(OD/DIV)
	B = OD-2*A
	BA = floortogrid(B/2-0.005)
	BB = B-BA
	dbCreatePolygon(pcCellView, list(layer purp), 
			list(0:BA 0:OP OD/2:0	 OD/2:BA+A A:BA+A))
)/*end of let*/
)/*end of pcDefinePCell*/

