
strCellName="vias_corner";	The Cell Name is called Inductor

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W	"float"	10.0)
	(LineW	"float"	3.0)
	(TOP_ME "int" 6)
	(BTM_ME "int" 9)
)
let((pitch num enc_prime master i j start end rodpg C enc),
	master = dbOpenCellViewByType(pcCellView~>lib "vdiag" "layout")
	if(TOP_ME >= BTM_ME
	then
		start = BTM_ME
		end = TOP_ME
	else
		start = TOP_ME
		end = BTM_ME
	)

	C =roundtogrid(LineW*(sqrt(2)-1))
	rodpg = rodCreatePolygon(
		?layer MetalVec(end-1)
		?pts list(0:C 0:0 LineW:0 W:W-LineW W:W W-C:W)
		?cvId pcCellView
	)

	if(start != end
	then
		for(j start end-1
			rodCreatePolygon(
				?layer MetalVec(j-1)
				?pts list(0:C 0:0 LineW:0 W:W-LineW W:W W-C:W)
				?cvId pcCellView
			)
				pitch = ViaWidthVec(j-1) + ViaSpacingVec(j-1)
				enc_prime = max(ViaSpacingVec(j-1)/2 ViaEncVec(j-1))
				num = floor((LineW-2*enc_prime + ViaSpacingVec(j-1))/pitch)
				enc = roundtogrid((LineW - num*pitch+ViaSpacingVec(j-1))/2)

			if((rfvlsi_em_export == 0) /* added by ywang on 20120422 */
			then

				if(num > 0
				then
					for(i 0 num-1
						dbCreateParamInst(pcCellView master nil 
						enc - ViaEncVec(j-1) + i*pitch:0 "R0" 1
							list(
							list("W" "float" W - i*pitch-enc_prime)
							list("VIA" "int" j)
						))
					)
				) /* end if*/
			else
				rodCreatePolygon(
                	?layer ViaVec(j-1)
	                ?pts 
						list(
							enc:C-enc 
							enc:enc 
							LineW-enc:enc
							W-enc:W-LineW+enc
							W-enc:W-enc
							W-C+enc:W-enc)
    	            ?cvId pcCellView
            	)
			)	/* end if(rfvlsi_em_export) */	
		)	/* end for */
	)
	rodAssignHandleToParameter(
                ?parameter "W"
                ?rodObj rodpg
                ?displayName "W"
                ?displayExpression "W"
                ?handleName list("upperLeft","upperCenter"
			"upperRight","lowerLeft","lowerCenter","lowerRight")
                ?stretchType "relative"
                ?moveOrigin t
                ?stretchDir "y"
                ?userFunction "std_CB"
        )
	rodAssignHandleToParameter(
                ?parameter "W"
                ?rodObj rodpg
                ?displayName "W"
                ?displayExpression "W"
                ?handleName list("centerLeft","centerLeft" 
			"upperRight","lowerLeft","lowerCenter","lowerRight")
                ?stretchType "relative"
                ?moveOrigin t
                ?stretchDir "x"
                ?userFunction "std_CB"
	)
))
