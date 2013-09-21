strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="prwbcap";	The Cell Name is called Inductor
strViewName="layout";	This is a virtuoso layout
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W_R	"float"	8.0) ; Line spacing
	(W	"float" 47.0)
	(len_Void	"float"	2.0) ; Line spacing
	(BTM_ME "int" 5)
    (digital "boolean" t)	
	(wc "string"    "7u")   ; width
    (lc "string"    "3.2u") ; length
    (lr "string"    "5u")   ; width
    (wr "string"    "0.5u") ; leng
)
let((master masterba y_spacing lp_space w_power row_sp),

	master = dbOpenCellViewByType(pcCellView~>lib "prails" "layout"); get the master view of a single turn layout
	masterba = dbOpenCellViewByType(pcCellView~>lib "bypar" "layout"); get the master view of a single turn layout
	y_spacing = 0.85
    lp_space = 0.5
    w_power = 1.0
	row_sp = y_spacing+1M*cdfParseFloatString(wr)+0.2+lp_space+w_power-(-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power)
    ;col_sp = (0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)+w_power)-(-0.94-wp_space-w_power)

	dbCreateParamInst(pcCellView master nil 0:0 "R0" 1
		list(
		        list("W_R" "float"   W_R)
		        list("W" "float"   W)
		        list("TOP_ME"   "int" 9)
		        list("BTM_ME"   "int" BTM_ME)
		        list("len_Void"   "float" len_Void)
				list("len_Fill"   "float" 2.0)
				list("digital"   "boolean" nil)
		) ; close list
		) ; close dbCreateParamInst
	
 dbCreateParamInst(pcCellView masterba nil 3.0:row_sp-3.0 "R0" 1
        list(
                list("rows1"   "int" 4)
                list("cols1"   "int" 4)
        ) ; close list
        ) ; close dbCreateParamInst

)/*end of let*/
)/*end of pcDefinePCell*/


