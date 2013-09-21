strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="cross";	The Cell Name is called Inductor
strViewName="layout";	This is a virtuoso layout
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(WX	"float"	5.0)	; Inductor total width
	(WY	"float"	5.0)	; Inductor total width
	(LX	"float"	10.0)	; Line width
	(LY	"float"	10.0)	; Line width
	(BTM_ME "int"	1) ; Turns
	(TOP_ME	"int"	4) ; Turns
)
let((techfile_lib techFileID i),
	techfile_lib = techGetTechLibName(pcCellView~>lib) ; Get the PDK library name
	techFileID = techGetTechFile(ddGetObj(techfile_lib))

	for(i BTM_ME TOP_ME
		 rectm9 = rodCreateRect(
                        ?layer MetalVec(i-1)
                        ?length 2*LX
                        ?width  2*WX
                        ?origin -WX:-LX
                        ?cvId   pcCellView
                );
	        ret = rodAssignHandleToParameter(
        	        ?parameter "WX"
	                ?rodObj rectm9
                	?displayName "WX"
        	        ?displayExpression "WX"
	                ?handleName list("centerLeft","centerRight")
                	?stretchType "relative"
        	        ?moveOrigin nil
	                ?stretchDir "x"
        	        ?userFunction "std_CB"
	        ) ; end rodAssignHandleToParameter

		ret = rodAssignHandleToParameter(
                        ?parameter "LX"
                        ?rodObj rectm9
                        ?displayName "LX"
                        ?displayExpression "LX"
                        ?handleName list("upperCenter","lowerCenter")
                        ?stretchType "relative"
                        ?moveOrigin nil
                        ?stretchDir "y"
                        ?userFunction "std_CB"
                ) ; end rodAssignHandleToParameter
		; dbCreateRect(pcCellView, list(sprintf(nil "M%d" i) "drawing"),list(-W:-L W:L))

		rectm9 = rodCreateRect(
                        ?layer MetalVec(i-1)
                        ?length 2*WY
                        ?width  2*LY
                        ?origin -LY:-WY
                        ?cvId   pcCellView
                );
                ret = rodAssignHandleToParameter(
                        ?parameter "WY"
                        ?rodObj rectm9
                        ?displayName "WY"
                        ?displayExpression "WY"
                        ?handleName list("upperCenter","lowerCenter")
                        ?stretchType "relative"
                        ?moveOrigin nil
                        ?stretchDir "y"
                        ?userFunction "std_CB"
                ) ; end rodAssignHandleToParameter

                ret = rodAssignHandleToParameter(
                        ?parameter "LY"
                        ?rodObj rectm9
                        ?displayName "LY"
                        ?displayExpression "LY"
                        ?handleName list("centerRight","centerLeft")
                        ?stretchType "relative"
                        ?moveOrigin nil
                        ?stretchDir "x"
                        ?userFunction "std_CB"
                ) ; end rodAssignHandleToParameter

;		dbCreateRect(pcCellView, list(sprintf(nil "M%d" i) "drawing"),list(-LY:-WY LY:WY))
	)
)/*end of let*/
)/*end of pcDefinePCell*/

