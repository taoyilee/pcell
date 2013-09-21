strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="ind";	The Cell Name is called Inductor
strViewName="layout";	This is a virtuoso layout
pcDefinePCell(

list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD	"float"	90.0)	; Inductor total width
	(W	"float"	3.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(GAP "float" 3.0)
	(NT	"int"	2) ; Turns
	(DIV 	"float"	3.5) ; Turns
	(LEAD	"float"	20.0) ; Turns
	(dmy_en 	"boolean" nil)
	(DMY_TEXT "string" "ind_a") 
)
let((pcCellView),
	pcCellView = pcCellView;  
	techfile_lib = techGetTechLibName(pcCellView~>lib) ; Get the PDK library name
	techFileID = techGetTechFile(ddGetObj(techfile_lib))


	master = dbOpenCellViewByType(strLibName "ind_oct_t" "layout"); get the master view of a single turn layout

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
;	dbCreateRect(pcCellView, ME_TOP_LAYER,list(OD:(GAP/2) OD+LEAD:(GAP/2+W))); Port a (I/O)
;	dbCreateRect(pcCellView, ME_TOP_LAYER,list(OD:(-GAP/2) OD+LEAD:(-GAP/2-W))); Port b (O/I)
;	dbCreateLabel(pcCellView, Pin2DmyLayer, (OD+LEAD-dmy/2):(-GAP/2-W/2), "P2", "centerCenter", "R0", "roman", 0.2)
)/*end of let*/
)/*end of pcDefinePCell*/

