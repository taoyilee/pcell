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


strCellName="via_enc";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W "float" 10.0) 
	(L "float" 20.0) 
	(LW "float" 2.0) 
	(TOP_ME "int" 1) 
	(BTM_ME "int" 2) 
	(bPP "boolean" t) 
)
let((m_vias),
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout");
	/* top */
	dbCreateParamInst(pcCellView m_vias nil LW:0 "R0" 1
    list(
        list("Width" "float" W-2*LW)
        list("Length" "float" LW)
        list("TOP_ME" "int" TOP_ME)
        list("BTM_ME" "int" BTM_ME)
		list("bPP" "boolean" bPP) 
    ))
	/* down */
	dbCreateParamInst(pcCellView m_vias nil LW:L "MX" 1
    list(
        list("Width" "float" W-2*LW)
        list("Length" "float" LW)
        list("TOP_ME" "int" TOP_ME)
        list("BTM_ME" "int" BTM_ME)
		list("bPP" "boolean" bPP) 
    ))
	/* lower left */
    dbCreateParamInst(pcCellView m_vias nil 0:0 "R0" 1
    list(
        list("Width" "float" LW)
        list("Length" "float" LW)
        list("TOP_ME" "int" TOP_ME)
        list("BTM_ME" "int" BTM_ME)
        list("bPP" "boolean" bPP)
    ))
	/* lower rightt */
    dbCreateParamInst(pcCellView m_vias nil W-LW:0 "R0" 1
    list(
        list("Width" "float" LW)
        list("Length" "float" LW)
        list("TOP_ME" "int" TOP_ME)
        list("BTM_ME" "int" BTM_ME)
        list("bPP" "boolean" bPP)
    ))
	/* top left */
    dbCreateParamInst(pcCellView m_vias nil 0:L-LW "R0" 1
    list(
        list("Width" "float" LW)
        list("Length" "float" LW)
        list("TOP_ME" "int" TOP_ME)
        list("BTM_ME" "int" BTM_ME)
        list("bPP" "boolean" bPP)
    ))
    /* top rightt */
    dbCreateParamInst(pcCellView m_vias nil W-LW:L-LW "R0" 1
    list(
        list("Width" "float" LW)
        list("Length" "float" LW)
        list("TOP_ME" "int" TOP_ME)
        list("BTM_ME" "int" BTM_ME)
        list("bPP" "boolean" bPP)
    ))


	/* left */
	dbCreateParamInst(pcCellView m_vias nil 0:LW "R0" 1
    list(
        list("Width" "float" LW)
        list("Length" "float" L-2*LW)
        list("TOP_ME" "int" TOP_ME)
        list("BTM_ME" "int" BTM_ME)
		list("bPP" "boolean" bPP) 
    ))
	/* right */
	dbCreateParamInst(pcCellView m_vias nil W:LW "MY" 1
    list(
        list("Width" "float" LW)
        list("Length" "float" L-2*LW)
        list("TOP_ME" "int" TOP_ME)
        list("BTM_ME" "int" BTM_ME)
		list("bPP" "boolean" bPP) 
    ))
)) /* end of */
