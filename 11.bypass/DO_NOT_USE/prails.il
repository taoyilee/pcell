strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="prails";	The Cell Name is called Inductor
strViewName="layout";	This is a virtuoso layout
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(H	"float"	50.0)	; Line width
	(W_R	"float"	5.0) ; Line spacing
	(W	"float" 30.0)
	(len_Void	"float"	1.0) ; Line spacing
	(len_Fill	"float" 1.0)
	(BTM_ME "int" 1)
	(TOP_ME	"int" 2)
    (DIG_ME "int" 3)	
    (digital "boolean" t)	
)
let((),
	;pcCellView = pcCellView;  
	techfile_lib = techGetTechLibName(pcCellView~>lib) ; Get the PDK library name
	techFileID = techGetTechFile(ddGetObj(techfile_lib))

	master = dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout"); get the master view of a single turn layout
	dbCreateParamInst(pcCellView master nil 0:0 "R0" 1
		list(
			list("Length"  "float" W_R)
		        list("Width" "float"   W)
		        list("TOP_ME"   "int" TOP_ME)
		        list("BTM_ME"   "int" BTM_ME)
		        list("len_Void"   "float" len_Void)
			list("len_Fill"   "float" len_Fill)
		) ; close list
		) ; close dbCreateParamInst
	
	dbCreateParamInst(pcCellView master nil 0:H-W_R "R0" 1
		list(
			list("Length"  "float" W_R)
		        list("Width" "float"   W)
		        list("TOP_ME"   "int" TOP_ME)
		        list("BTM_ME"   "int" BTM_ME)
		        list("len_Void"   "float" len_Void)
			list("len_Fill"   "float" len_Fill)
		) ; close list
		) ; close dbCreateParamInst
	
if(digital
then
	dbCreateRect(pcCellView, MetalVec(DIG_ME-1),list(0.25:0 0.25+0.41:H))
	dbCreateRect(pcCellView, MetalVec(DIG_ME-1),list(0.25+0.41+0.6:0 0.25+0.41+0.6+0.41:H))
	dbCreateRect(pcCellView, MetalVec(DIG_ME-1),list(0.25+0.41+0.6+0.41+2.36:0 0.25+0.41+0.6+0.41+2.36+0.41:H))
)
)/*end of let*/
)/*end of pcDefinePCell*/


