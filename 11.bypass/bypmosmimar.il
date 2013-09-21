strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="bypmosmimar";	The Cell Name is called Inductor
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(rows1 "int" 1) 
	(cols1 "int" 3) 
)
let((row_sp col_sp),
	row_sp = 36.96
	col_sp = 46.36
	dbCreateParamSimpleMosaic(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "bypmosmim12x" "layout")
		"M0"  0:0 "R0" rows1 cols1 row_sp col_sp
		list(
		) ; close list
	)

)/*end of let*/
)/*end of pcDefinePCell*/
