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
	(WR_DIG	"float"	10.0) ; right side metal width for digital circuits
	(WL_DIG	"float"	10.0) ; left side metal width for digital circuits
	(BTM_ME "int" 1)
	(TOP_ME	"int" 5)
    (BTM_ME_DIG "int" 3)	
)
let((), 
	techfile_lib = techGetTechLibName(pcCellView~>lib) ; Get the PDK library name
	techFileID = techGetTechFile(ddGetObj(techfile_lib))	
	master = dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout"); get the master view of a single turn layout

    if( WL_DIG < 1 then
		WL_DIG = 0
	else
	dbCreateParamInst(pcCellView master nil 0:0 "R0" 1
		list(
			list("Length"  "float" W_R)
		        list("Width" "float"   WL_DIG)
		        list("TOP_ME"   "int" TOP_ME)
		        list("BTM_ME"   "int" BTM_ME_DIG)
		        list("len_Void"   "float" len_Void)
			list("len_Fill"   "float" len_Fill)
		) ; close list
		) ; close dbCreateParamInst
	
	dbCreateParamInst(pcCellView master nil 0:H-W_R "R0" 1
		list(
			list("Length"  "float" W_R)
		        list("Width" "float"   WL_DIG)
		        list("TOP_ME"   "int" TOP_ME)
		        list("BTM_ME"   "int" BTM_ME_DIG)
		        list("len_Void"   "float" len_Void)
			list("len_Fill"   "float" len_Fill)
		) ; close list
		) ; close dbCreateParamInst	
	)	
	
	dbCreateParamInst(pcCellView master nil WL_DIG:0 "R0" 1
		list(
			list("Length"  "float" W_R)
		        list("Width" "float"   W)
		        list("TOP_ME"   "int" TOP_ME)
		        list("BTM_ME"   "int" BTM_ME)
		        list("len_Void"   "float" len_Void)
			list("len_Fill"   "float" len_Fill)
		) ; close list
		) ; close dbCreateParamInst
	
	dbCreateParamInst(pcCellView master nil WL_DIG:H-W_R "R0" 1
		list(
			list("Length"  "float" W_R)
		        list("Width" "float"   W)
		        list("TOP_ME"   "int" TOP_ME)
		        list("BTM_ME"   "int" BTM_ME)
		        list("len_Void"   "float" len_Void)
			list("len_Fill"   "float" len_Fill)
		) ; close list
		) ; close dbCreateParamInst
		
    if( WR_DIG < 1 then
		WR_DIG = 0
	else
	dbCreateParamInst(pcCellView master nil W+WL_DIG:0 "R0" 1
		list(
			list("Length"  "float" W_R)
		        list("Width" "float"   WR_DIG)
		        list("TOP_ME"   "int" TOP_ME)
		        list("BTM_ME"   "int" BTM_ME_DIG)
		        list("len_Void"   "float" len_Void)
			list("len_Fill"   "float" len_Fill)
		) ; close list
		) ; close dbCreateParamInst
	
	dbCreateParamInst(pcCellView master nil W+WL_DIG:H-W_R "R0" 1
		list(
			list("Length"  "float" W_R)
		        list("Width" "float"   WR_DIG)
		        list("TOP_ME"   "int" TOP_ME)
		        list("BTM_ME"   "int" BTM_ME_DIG)
		        list("len_Void"   "float" len_Void)
			list("len_Fill"   "float" len_Fill)
		) ; close list
		) ; close dbCreateParamInst
	)	
		
)/*end of let*/
)/*end of pcDefinePCell*/


