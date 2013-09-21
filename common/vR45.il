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

strCellName="vR45"
strLibName="RFVLSI_N65"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(DiagWidth1 "float"   2.0)
	(DiagWidth2 "float"   3.0)
	(MET	  "int" 8)
)
let((Pitch n_vias i VS DW edge),
	VS = ceiltogrid(ViaSpacingVec(MET-1)/sqrt(2))+0.005
	Pitch=ViaWidthVec(MET-1)+VS
	DW = min(roundtogrid(DiagWidth1*sqrt(2)) roundtogrid(DiagWidth2*sqrt(2)))
	n_vias1 = floor((DiagWidth1 - 2*ViaEncVec(MET-1)+ sqrt(2)*ViaWidthVec(MET-1))/(sqrt(2)*ViaWidthVec(MET-1)+ViaSpacingVec(MET-1)))
	n_vias2 = floor((DiagWidth2 - 2*ViaEncVec(MET-1)+ sqrt(2)*ViaWidthVec(MET-1))/(sqrt(2)*ViaWidthVec(MET-1)+ViaSpacingVec(MET-1)))
	edge = roundtogrid((DW-2*(n_vias1-1)*Pitch-VS)/2)

	if((rfvlsi_em_export == 0) /* added by ywang on 20120422 */
	then
		for(i 0 n_vias1-1
			dbCreateParamInst(pcCellView
				dbOpenCellViewByType(pcCellView~>lib "vdiag_single" "layout" ) nil 
				edge+i*Pitch:-ViaWidthVec(MET-1)/2-i*Pitch "R0" 1 
				list(
	        	list("n"  "int" n_vias2)
        		list("MET" "int"   MET)
    		))
		)
	else
		dbCreatePolygon(pcCellView, ViaVec(MET-1),
            list(DiagWidth1/sqrt(2):-DiagWidth1/sqrt(2)
                DiagWidth2/sqrt(2)+DiagWidth1/sqrt(2):DiagWidth2/sqrt(2)-DiagWidth1/sqrt(2) 
				DiagWidth2/sqrt(2):DiagWidth2/sqrt(2) 
				0:0 				                
            ))
	)

)/*end of let*/
)/*end of pcDefinePCell*/

                                                              
