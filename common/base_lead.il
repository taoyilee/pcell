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

	
strCellName="base_lead";	Cell Name


; Define my parameterized cell with the information above
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(L 	"float" 10.0)	; Inductor total width
	(W  	"float" 8.0)	; Line width
	(WD  	"float" 1.0)	; controlling the location to place pins.
	(PINTXT "string" "p1")	; Line width
	(PINP "string" 	 "dummy1")	; Line width
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	(DUMMYL "string" "RFVLSI")
	(DUMMYP "string" "drawing")
	(dummy "boolean" t)
)
let((m),
	/*	lead drawn by vias	*/ 
	dbCreateParamInst(pcCellView
    	dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
		nil 0:0 "R0" 1
        list(
                 list("Length"  "float" W)
                 list("Width"    "float" L)
                 list("TOP_ME"   "int"   atoi(TOP_ME))
                 list("BTM_ME"   "int"   atoi(BTM_ME)))) ; close dbCreateParamInst
	/*	(end) lead drawn by vias	*/ 
	/*	drawn dummy layers	*/ 
	if(dummy
	then
		dbCreateRect(pcCellView, list(DUMMYL,DUMMYP),list(0:0 L-0.1:W))
;		for(m (atoi(BTM_ME)-1) (atoi(TOP_ME)-1)
;			dbCreateRect(pcCellView, RFVLSI_LVS_Vec(m),list(0:0 L-0.1:W))
;		)
		dbCreateRect(pcCellView, list(DUMMYL, PINP),	list(L-WD-0.1:0 L-0.1:W))
		dbCreateLabel(pcCellView, list(DUMMYL,PINP), L-WD/2-0.1:W/2, PINTXT, "centerCenter", "R90", "roman", 0.5)
	)
	/*	end of drawn dummy layers	*/ 

)/*end of let*/
)/*end of pcDefinePCell*/
