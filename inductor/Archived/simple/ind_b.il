/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */


strLibName="RFVLSI_N65";	
strCellName="ind_b";	

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD	"float"	90.0)	; Inductor total width
	(W	"float"	3.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(NT	"int"	2) ; Turns
	(DIV 	"float"	3.5) ; Turns
	(LEAD	"float"	20.0) ; Turns
	(TOP_ME	"int" 9)
        (BTM_ME	"int" 8)
	(INDDMY       "string" "RFVLSI")
        (INDDMYP      "string" "drawing")
        (dummy      "boolean" t)
        (P1DMY "string" "RFVLSI")
        (P1DMYP        "string" "dummy1")
        (P2DMY "string" "RFVLSI")
        (P2DMYP        "string" "dummy2")
        (TEXTDMY   "string" "RFVLSI")
        (TEXTDMYP   "string" "dummy4")
        (textlbl   "string" "ind")
)

let((idCellView),
idCellView=pcCellView;  

techfile_lib = techGetTechLibName(pcCellView~>lib)
techFileID = techGetTechFile(ddGetObj(techfile_lib))
maskGrid = techGetParam(techFileID "maskGrid")
fprintf(stderr "PCELL BY TAO YI LEE (michael@michaelgod.idv.tw)\nRFVLSILAB, NCTU\n")

	P=W+S; Line pitch: width + space
	pi=3.1415926; the universal constant
	dmy = 0.5
	dmyedge = dmy/2
	master = dbOpenCellViewByType(pcCellView~>lib "ind_turn" "layout")
	declare(inst[NT-1])
	for(i 1 NT-1
		inst[i-1] = dbCreateParamInst(
			pcCellView master nil (i-1)*P:0 "R0" 1
			list(
			list("W" "float" W)
			list("S" "float" S)
			list("DIV" "float" DIV)
			list("OD" "float" OD-(i-1)*2*P)
			list("TOP_ME" "int" TOP_ME)
			list("BTM_ME" "int" BTM_ME)
			list("dummy" "boolean" dummy)
		        list("INDDMY" "string" INDDMY)
		        list("INDDMYP" "string" INDDMYP))) ; close dbCreateParamInst
	)

; Last cycle is always different, depending on parameter NT 
masterl = dbOpenCellViewByType(pcCellView~>lib "ind_lturn" "layout")
        instl = dbCreateParamInst(
        pcCellView masterl nil (NT-1)*P:0 "R0" 1
        list(
        list("W" "float" W)
        list("S" "float" S)
	list("TOP_ME" "int" TOP_ME)
	list("BTM_ME" "int" BTM_ME)
	list("DIV" "float" DIV)
        list("OD" "float" OD-(NT-1)*2*P)
        list("INDDMY" "string" INDDMY)
        list("INDDMYP" "string" INDDMYP)
        ) ; close list
) ; close dbCreateParamInst

	if(NT!=1
	then
		masterud = dbOpenCellViewByType(pcCellView~>lib "ind_under" "layout")
		
		instl = dbCreateParamInst(pcCellView masterud nil OD:0 "R0" 1
	        list(
	        	list("W" "float" W)
		        list("S" "float" S)
		        list("TOP_ME" "int" TOP_ME)
		        list("BTM_ME" "int" BTM_ME)
		        list("NT" "int" NT)
	        ))
		rodId = rodGetObj(inst[0])
		rodAssignHandleToParameter(
                        ?parameter "OD"
                        ?rodObj rodId
                        ?displayName "OD"
                        ?displayExpression "OD"
                        ?handleName list("centerRight")
                        ?stretchType "relative"
                        ?moveOrigin nil
                        ?stretchDir "x"
                        ?userData list(1 maskGrid)
                        ?userFunction "param_CB"
        	) ; end rodAssignHandleToParameter
	else	
		rodId = rodGetObj(instl)
                rodAssignHandleToParameter(
                        ?parameter "OD"
                        ?rodObj rodId
                        ?displayName "OD"
                        ?displayExpression "OD"
                        ?handleName list("centerRight")
                        ?stretchType "relative"
                        ?moveOrigin nil
                        ?stretchDir "x"
                        ?userData list(1 maskGrid)
                        ?userFunction "param_CB"
                ) ; end rodAssignHandleToParameter
	) /* end if */
	
	rectOutline2 = rodCreateRect( /* lead (upper) */
                ?layer MetalVec(TOP_ME-1)
                ?length W
                ?width  LEAD
                ?origin OD:S
                ?cvId   idCellView
                );

	rectOutline=rodCreateRect(  /* lead (lower) */
                ?layer MetalVec(TOP_ME-1)
                ?length W
                ?width  LEAD-P
                ?origin OD+P:-W
                ?cvId   idCellView
                );

        rodAssignHandleToParameter(
	        ?parameter "LEAD"
                ?rodObj rectOutline
                ?displayName "LEAD"
                ?displayExpression "LEAD"
                ?handleName list("centerRight")
                ?stretchType "relative"
                ?moveOrigin t
                ?stretchDir "x"
                ?userData list(1 maskGrid)
                ?userFunction "param_CB"
        ) ; end rodAssignHandleToParameter
	
	rodAssignHandleToParameter(
                ?parameter "S"
                ?rodObj rectOutline2
                ?displayName "S"
                ?displayExpression "S"
                ?handleName list("lowerCenter")
                ?stretchType "absolute"
                ?moveOrigin nil
                ?stretchDir "y"
                ?userData list(1 maskGrid)
                ?userFunction "param_CB"
        ) ; end rodAssignHandleToParameter

	rodAssignHandleToParameter(
                ?parameter "W"
                ?rodObj rectOutline2
                ?displayName "W"
                ?displayExpression "W"
                ?handleName list("upperCenter")
                ?stretchType "absolute"
                ?moveOrigin nil
                ?stretchDir "y"
                ?userData list(1 maskGrid)
                ?userFunction "param_CB"
        ) ; end rodAssignHandleToParameter



if(dummy
then
	/* :VS layers */
	dbCreateRect(idCellView, list(INDDMY,INDDMYP),list(OD:S OD+LEAD-dmyedge:P))
	dbCreateRect(idCellView, list(INDDMY,INDDMYP),list(OD+P:0 OD+LEAD-dmyedge:-W))
	dbCreateLabel(idCellView, list(TEXTDMY, TEXTDMYP), OD:-W/2, textlbl, "centerCenter", "R0", "roman", W)
	/* :VS layers  : PORTS */
	dbCreateRect(idCellView, list(P1DMY,P1DMYP),list(OD+LEAD-dmyedge-dmy:S OD+LEAD-dmyedge:P))
	dbCreateLabel(idCellView, list(P1DMY, P1DMYP), OD+LEAD-dmyedge-dmy/2:S+W/2, "P1", "centerCenter", "R0", "roman", 0.2)
	dbCreateRect(idCellView, list(P2DMY,P2DMYP),list(OD+LEAD-dmyedge-dmy:0 OD+LEAD-dmyedge:-W))
	dbCreateLabel(idCellView, list(P2DMY, P2DMYP), OD+LEAD-dmyedge-dmy/2:-W/2, "P2", "centerCenter", "R0", "roman", 0.2)
)
)/*end of let*/
)/*end of pcDefinePCell*/

