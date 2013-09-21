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

	
strCellName="base_cross45";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W "float" 2.0)	; Line width
	(L	"float" 10.0) ; Line spacing
	(TOP_ME	"int"	9) ; Line spacing
	(BTM_ME	"int"	8) ; Line spacing
)
let((m_underR45 ),
	
	m_underR45 = dbOpenCellViewByType(pcCellView~>lib "underR45" "layout" );
	dbCreateParamInst(pcCellView m_underR45 nil -W/2-L/2:-L/2  "R0" 1 list(
			list("TOP_ME" "int" TOP_ME)
			list("BTM_ME" "int" BTM_ME)
			list("Width"  "float" W)
			list("Length" "float" L)
	))
	 dbCreateParamInst(pcCellView m_underR45 nil -W/2-L/2:L/2  "MX" 1 list(
            list("TOP_ME" "int" TOP_ME)
            list("BTM_ME" "int" TOP_ME)
            list("Width"  "float" W)
            list("Length" "float" L)
    ))

))
