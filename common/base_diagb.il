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

	
strCellName="base_diagb";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W 	"float" 2.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(OP	"float"	20.0) ; Line spacing
	(TOP_ME	"int"	9) ; Line spacing
	(BTM_ME	"int"	8) ; Line spacing
	(centerR45  "float" 20.0) ; Line spacing
)
let((pi  C C2 X_max center diag W2 center1),
	pi=3.141592
	X_max = S+2*W
	W2 = roundtogrid(W/sqrt(2))
	C = ceiltogrid(W*tan(pi/8)+0.005)
	C2 = roundtogrid(C/2)
	diag_y = (X_max - W)
	stra_y1 = roundtogrid((OP-diag_y)/2)
	stra_y2 = OP - stra_y1-diag_y
	center = roundtogrid((centerR45+W)/sqrt(2)+0.01)
	center1 = roundtogrid(centerR45/sqrt(2)+0.01)
	diag = roundtogrid((X_max-center)/2)
		dbCreatePolygon(pcCellView, MetalVec(TOP_ME-1),
			list(
				0:0 W:0
				W:stra_y1-C2 
				diag+W2:stra_y1+C2+diag-W2
				diag:stra_y1+C2+diag
				0:stra_y1+C2
			))

	/*dbCreatePolygon(pcCellView, MetalVec(TOP_ME-1),
            list(
                diag+W2+center1:stra_y1+C2+diag-W2+center1
                diag+center1:stra_y1+C2+diag+center1
				X_max-W:OP-stra_y2+C2
				X_max-W:OP
				X_max:OP
				X_max:OP-stra_y2-C2
            ))*/
		dbCreatePolygon(pcCellView, MetalVec(TOP_ME-1),
            list(
				X_max:OP-stra_y2-C2
				X_max:OP
				X_max-W:OP
				X_max-W:OP-stra_y2+C2
				diag+center1:stra_y1+C2+diag+center1
                diag+W2+center1:stra_y1+C2+diag-W2+center1
            ))



		dbCreateParamInst(pcCellView
			dbOpenCellViewByType(pcCellView~>lib "vR45" "layout" ) nil 
			diag-W2:stra_y1+C2+diag-W2 "R0" 1 
			list(
        	list("DiagWidth1"  "float" W)
        	list("DiagWidth2"  "float" W)
        	list("MET" "int"   BTM_ME)
    	))

		dbCreateParamInst(pcCellView
            dbOpenCellViewByType(pcCellView~>lib "vR45" "layout" ) nil
            diag+2*W2+center1:stra_y1+C2+diag+center1 "MY" 1
            list(
            list("DiagWidth1"  "float" W)
            list("DiagWidth2"  "float" W)
            list("MET" "int"   BTM_ME)
        ))

                                                              
		dbCreatePolygon(pcCellView, MetalVec(BTM_ME-1),
            list(
				diag+center1+W2:stra_y1+C2+diag+center1+W2
				diag-W2:stra_y1+C2+diag-W2
                diag:stra_y1+C2+diag-2*W2
				diag+2*W2+center1:stra_y1+C2+diag+center1                                           
            ))

))
