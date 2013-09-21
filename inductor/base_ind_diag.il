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
	
strCellName="base_ind_diag";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W 	"float" 2.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(MET	"int"	9) ; Line spacing
)
let((pi P C C2  OO OOC OOCH ),
	pi=3.141592
	P = S+W
	C = ceiltogrid(W*tan(pi/8)+0.005)
	C2 = ceiltogrid(C/sqrt(2))
	OO = 2*W+S
	OOC = 2*W+S-2*C2
	OOCH = OOC/2
	if(S <=2.0*sqrt(2)
	then		
		dbCreatePolygon(pcCellView, MetalVec(MET-1),
			list(
				0:-OOCH+C 0:-(OOCH + ceiltogrid(2.01*sqrt(2.0)- S)) 
				W:-(OOCH + ceiltogrid(2.01*sqrt(2.0)- S)) W:-OOCH
				W+P:-OOCH+P OO:(OOCH + ceiltogrid(2.01*sqrt(2.0)- S))
				OO-W:(OOCH + ceiltogrid(2.01*sqrt(2.0)- S)) P:-OOCH+C+P
			))
	else
		dbCreatePolygon(pcCellView, MetalVec(MET-1),
		list(
			0:OOCH-P 0:-OOCH
			W:-OOCH W+P:-OOCH+P 
			OO:OOCH	P:OOCH
		))
	)
))
