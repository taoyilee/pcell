strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="bypmimar";	The Cell Name is called Inductor
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(y_spacing "float" 0.85) 
	(height "float" 8.36) 
	(rows1 "int" 1) 
	(cols1 "int" 3) 
	(LineW "float" 1.0) 
	(vdd_left "float" 0.0) 
	(vdd_right "float" 0.0) 
	(vdd_top "float" 0.0) 
	(vdd_down "float" 0.0) 
)
let((row_sp col_sp),
	row_sp = 36.96
	col_sp = 46.36
	dbCreateParamSimpleMosaic(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "bypmim12x" "layout")
		"M0"  0:0 "R0" rows1 cols1 row_sp col_sp
		list(
		) ; close list
	)

)/*end of let*/
)/*end of pcDefinePCell*/
