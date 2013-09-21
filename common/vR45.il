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

                                                              
