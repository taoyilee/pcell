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


pcDefinePCell(list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length  "float" 30.0)
	(SegLength  "float" 10.0)
	(Width "float"   2.5)
	(cols   "int"   2)
	(cols_sp   "float"   3.0)
	(TOP_ME   "int" 7)
	(BTM_ME   "int" 6)
)
let((master rows LengthRmdr rodpath1),

	rows =  floor(Length/SegLength)
	LengthRmdr = Length - rows*SegLength

	master=dbOpenCellViewByType(pcCellView~>lib "segline" "layout")

	if(rows > 0
	then ;Length > SegLength
	        dbCreateParamSimpleMosaic(pcCellView master  "M0"  0:0 "R0" 
		rows cols SegLength cols_sp+Width
                list(
                        list("Length"     "float"    SegLength)   ; Line width
                        list("Width"     "float"     Width)   ; Line width
                        list("BTM_ME"  "int"    BTM_ME) ; Turns
                        list("TOP_ME"   "int"   TOP_ME) ; Turns
                ))
	)

		rodpath1 = rodCreatePath(
                ?name "rodpath1"
                ?layer MetalVec(TOP_ME-1)
                ?pts list(0:0 0:Length)
                ?width Width
                ?cvId pcCellView
        ) ; end rodCreatePath

        rodAssignHandleToParameter(
	        ?parameter "Length"
	        ?rodObj rodpath1
	        ?displayName "Length"
	        ?displayExpression "Length"
	        ?handleName list("lowerCenter" "upperCenter")
	        ?stretchType "relative"
	        ?moveOrigin t 
        	?stretchDir "y"
	        ?userFunction "std_CB"
        )

	if(LengthRmdr > 0
	then
	dbCreateParamSimpleMosaic(pcCellView master  "M1"  0:rows*SegLength "R0" 1 cols SegLength cols_sp + Width

                list(
                        list("Length"     "float"    LengthRmdr)   ; Line width
                        list("Width"     "float"     Width)   ; Line width
                        list("BTM_ME"  "int"    BTM_ME) ; Turns
                        list("TOP_ME"   "int"   TOP_ME) ; Turns
                ))
	)
)/*end of let*/
)/*end of pcDefinePCell*/
