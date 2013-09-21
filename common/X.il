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


strCellName="X"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W	"float" 4.0)	
	(S	"float" 8.0)	
	(OP	"float" 20.0)	
	(TOP_ME	"int" 9)	
	(BTM_ME	"int" 8)	
)
let((TotalWidth pi masterc TotalWidth m_vias 
	C centerR45 center diag sta1 sta2 W2),
	pi = 3.141592
	TotalWidth = 2*W+S
	C = ceiltogrid(W*tan(pi/8)+0.005)
	W2 = roundtogrid(W/sqrt(2))
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" );
	m_diag = dbOpenCellViewByType(pcCellView~>lib "base_diag" "layout" );
	m_diagb = dbOpenCellViewByType(pcCellView~>lib "base_diagb" "layout" );
	centerR45 = (2*MinMetSpacing(TOP_ME) + W)

	/* lower left */
	dbCreateParamInst(pcCellView m_diag nil (-TotalWidth/2):(-OP/2) "R0" 1 list(
		list("W"  "float" W)
		list("S"  "float" S)
		list("OP"  "float" OP)
	    list("MET" "int"   TOP_ME) 
	))
	/* lower right */
	dbCreateParamInst(pcCellView m_diagb nil (TotalWidth/2):(-OP/2) "MY" 1 list(
        list("W"  "float" W)
		list("S"  "float" S)
		list("OP"  "float" OP)
		list("centerR45"  "float" centerR45)
        list("TOP_ME" "int"   TOP_ME)
        list("BTM_ME" "int"   BTM_ME)
    ))
)
)
