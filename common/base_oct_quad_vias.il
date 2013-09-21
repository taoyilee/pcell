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

	
strCellName="base_oct_quad_vias";	
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 50.0)  ; Inductor total width
	(W	"float" 5.0)	; Line width
	(OP "float"	0.0) 
	(MET "int"	9) 
)
let((pi C A B BA BB DIV m_vias_diagonal_nomet m_vias_nomet),
    m_vias_diagonal_nomet = dbOpenCellViewByType(pcCellView~>lib "vias_diagonal_nomet" "layout" )
    m_vias_nomet = dbOpenCellViewByType(pcCellView~>lib "vias_nomet" "layout" )

	pi = 3.141592
	C = ceiltogrid(W*tan(pi/8)+0.005)
	DIV = 2+sqrt(2)
	A = roundtogrid(OD/DIV)
	B = OD-2*A
	BA = floortogrid(B/2-0.005)
	BB = B-BA

		dbCreateParamInst(pcCellView m_vias_nomet nil OD/2-BB:OD/2-W "R0" 1
        list(
            list("Length" "float" W)
            list("Width" "float" BB)
            list("TOP_ME" "int" MET)
            list("conservative" "boolean" t)
            list("BTM_ME" "int" MET-1)
        ))

	if(OP < BA
	then
		dbCreateParamInst(pcCellView m_vias_diagonal_nomet nil 0:BA "R0" 1
        list(
            list("Length" "float" OD/2- BA-W)
            list("Width" "float" W+C)
            list("TOP_ME" "int" MET)
            list("BTM_ME" "int" MET-1)
        ))

		dbCreateParamInst(pcCellView m_vias_nomet nil 0:OP "R0" 1
        list(
            list("Length" "float" BA-OP)
            list("Width" "float" W)
            list("TOP_ME" "int" MET)
            list("BTM_ME" "int" MET-1)
        ))
	else
		 dbCreateParamInst(pcCellView m_vias_diagonal_nomet nil MinMetSpacing(8)+(OP-BA):OP+MinMetSpacing(8) "R0" 1
        	list(
            list("Length" "float" OD/2 - BA-W-MinMetSpacing(8) - (OP-BA))
            list("Width" "float" W+C)
            list("TOP_ME" "int" MET)
            list("BTM_ME" "int" MET-1)
        ))

	)

)/*end of let*/
)/*end of pcDefinePCell*/

