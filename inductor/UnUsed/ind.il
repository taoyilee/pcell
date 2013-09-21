/****p* Inductor/Inductor
 * DESCRIPTION
 *   Shout panic, free resources, and shut down.
 * SEE ALSO
 *   Robodoc/W
 *   Robodoc/PowerMOS
 * SYNOPSIS
 */
strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="ind";	The Cell Name is called Inductor
strViewName="layout";	This is a virtuoso layout
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
 /*
  * PARAMETERS 
  */
	(OD	"float"	90.0)	; Inductor total width
	(W	"float"	3.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(GAP "float" 3.0)
	(NT	"int"	2) ; Turns
	(DIV 	"float"	3.5) ; Turns
	(LEAD	"float"	20.0) ; Turns
	(dmy_en 	"boolean" nil)
	(DMY_TEXT "string" "ind_a") 
/* 
 * SOURCE 
 */
)
let((pcCellView maskGrid ME_TOP ME_JMP ME_TOP_LAYER METAL_PREFIX techfile_lib techFileID strLibName IndDmyLayer Pin1DmyLayer Pin2DmyLayer 
TextDmyLayer P pi dmy dmyedge MEJMP master masterv instv inst),
	pcCellView = pcCellView;  

	ME_TOP=9
	ME_JMP=8
	ME_TOP_LAYER =list("M9","drawing")
	ME_UNDERPASS_LAYER =list("M8","drawing")
	METAL_PREFIX="M"
	techfile_lib="tsmcN65"
	techFileID = techGetTechFile(ddGetObj(techfile_lib))
	maskGrid = techGetParam(techFileID "maskGrid")
	strLibName="RFVLSI_N65"
	IndDmyLayer= list("RFVLSI_LVS" "drawing")
	Pin1DmyLayer= list("RFVLSI_LVS" "lvs_pin1")
	Pin2DmyLayer= list("RFVLSI_LVS" "lvs_pin2")
		
	P=W+S; Line pitch: width + space
	pi=3.1415926; the universal constant
	dmy = 0.5
	
	declare(inst[NT]); the instance array

	MEJMP=strcat(METAL_PREFIX sprintf(nil "%d" ME_JMP))
	master = dbOpenCellViewByType(strLibName "ind_oct_t" "layout"); get the master view of a single turn layout

if((NT!=1) then	
	for(i 1 NT
		; instantiate parameterized Cell for a single ture with specific offset and total width
		inst[i-1] = dbCreateParamInst(
		pcCellView master nil (i-1)*P:0 "R0" 1
		list(
		list("OD" "float" OD-(i-1)*2*P)
		list("W" "float" W)
		list("S" "float" S)
		list("GAP" "float" GAP)
		list("DIV" "float" DIV)
		list("dmy_en" "boolean" dmy_en)
		) ; close list
		) ; close dbCreateParamInst
		dbFlattenInst(inst[i-1] 1 t); Flatten every instance for merging
	)
else
	for(i 1 NT
		; instantiate parameterized Cell for a single ture with specific offset and total width
		inst[i-1] = dbCreateParamInst(
		pcCellView master nil (i-1)*P:0 "R0" 1
		list(
		list("OD" "float" OD-(i-1)*2*P)
		list("W" "float" W)
		list("S" "float" -W)
		list("GAP" "float" GAP)
		list("DIV" "float" DIV)
		list("dmy_en" "boolean" dmy_en)
		) ; close list
		) ; close dbCreateParamInst
		dbFlattenInst(inst[i-1] 1 t); Flatten every instance for merging
	)
);end IF

; Last cycle is always different, depending on parameter NT 

	;JUMPER HERE!!!!
	masterVIAS = dbOpenCellViewByType(strLibName "vias" "layout"); get the master view of a single turn layout	
	dbCreateRect(pcCellView, ME_TOP_LAYER,list(OD+S:(GAP/2) OD+LEAD:(GAP/2+W))); Port a (I/O)
if((NT!=1) then
	dbCreateRect(pcCellView, ME_TOP_LAYER,list((OD+P):(-GAP/2) OD+LEAD:(-GAP/2-W))); Port b (O/I)
	dbCreateRect(pcCellView, ME_TOP_LAYER,list(OD+S:(GAP/2) OD+LEAD:(GAP/2+W))); Port a (I/O)
	
	dbCreateParamInst(
	pcCellView masterVIAS nil (OD-(NT-1)*P-W):(GAP/2) "R0" 1
	list(
	list("Length" "float"    W)
	list("Width" "float"   W)
	list("TOP_ME" "float" 9)
	list("BTM_ME" "float" 8)        
	) ; close list
	) ; close dbCreateParamInst	
	
	dbCreateParamInst(
	pcCellView masterVIAS nil (OD+S):(GAP/2) "R0" 1
	list(
	list("Length" "float"    W)
	list("Width" "float"   W)
	list("TOP_ME" "float" 9)
	list("BTM_ME" "float" 8)        
	) ; close list
	) ; close dbCreateParamInst	
	dbCreateRect(pcCellView, ME_UNDERPASS_LAYER,list((OD-(NT-1)*P-W):(GAP/2) (OD+S):(GAP/2+W)))
	for(i 1 (NT-1)
		dbCreateRect(pcCellView, ME_TOP_LAYER,list((OD-(i-1)*P-W):(-GAP/2) (OD-(i-1)*P):(GAP/2)))
		dbCreateRect(pcCellView, IndDmyLayer,list((OD-(i-1)*P-W):(-GAP/2) (OD-(i-1)*P):(GAP/2)))
	)
	
else
	dbCreateRect(pcCellView, ME_TOP_LAYER,list(OD:(GAP/2) OD+LEAD:(GAP/2+W))); Port a (I/O)
	dbCreateRect(pcCellView, ME_TOP_LAYER,list(OD:(-GAP/2) OD+LEAD:(-GAP/2-W))); Port b (O/I)
);END OF IF
/* :VS layers */
	if(dmy_en
	then
	dbCreateRect(pcCellView, IndDmyLayer,list(OD-NT*P+S:(GAP/2) OD+LEAD:(GAP/2+W))); Draw the bridge which connects output port and the last turn
	dbCreateLabel(pcCellView, IndDmyLayer, OD:(GAP/2+W/2), DMY_TEXT, "centerCenter", "R0", "roman", W/2)
	dbCreateRect(pcCellView, IndDmyLayer,list(OD:(-GAP/2) OD+LEAD:(-GAP/2-W))); Port b (O/I)
	/* :VS layers  : PORTS */
	dbCreateRect(pcCellView, Pin1DmyLayer,list(OD+LEAD-dmy:(GAP/2) OD+LEAD:(GAP/2+W)))
	dbCreateLabel(pcCellView, Pin1DmyLayer, (OD+LEAD-dmy/2):(GAP/2+W/2), "P1", "centerCenter", "R0", "roman", 0.2)
	dbCreateRect(pcCellView, Pin2DmyLayer,list((OD+LEAD-dmy):(-GAP/2) OD+LEAD:(-GAP/2-W)))
	dbCreateLabel(pcCellView, Pin2DmyLayer, (OD+LEAD-dmy/2):(-GAP/2-W/2), "P2", "centerCenter", "R0", "roman", 0.2)
	)

)/*end of let*/
)/*end of pcDefinePCell*/
/******/
