strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="bypar";	The Cell Name is called Inductor
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(wc	"string"	"7u")	; width
	(lc	"string"	"3.2u") ; length
	(lr	"string"	"5u")	; width
	(wr	"string"	"0.5u") ; length
	(byp	"string" "byp2x") ; length
	(y_spacing "float" 0.85) 
	(height "float" 8.36) 
	(rows1 "int" 3) 
	(cols1 "int" 3) 
	(LineW "float" 1.0) 
	(vdd_left "float" 0.0) 
	(vdd_right "float" 0.0) 
	(vdd_top "float" 0.0) 
	(vdd_down "float" 0.0) 
	(lp_space "float" 0.5) 
	(wp_space "float" 0.5) 
	(w_power "float" 1.0) ;power width
	(cap_finger "int" 2);finger
)
let((row_sp col_sp),

;	row_sp = 1M*cdfParseFloatString(wc) + 1M*cdfParseFloatString(wr)+ y_spacing + 2*LineW+2
;	col_sp = 1M*cdfParseFloatString(lc)+ 0.94
	row_sp = y_spacing+1M*cdfParseFloatString(wr)+0.2+lp_space+w_power-(-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power)
	col_sp = (0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)+w_power)-(-0.94-wp_space-w_power)
	dbCreateParamSimpleMosaic(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib byp "layout")
		"M0"  0:0 "R0" rows1 cols1 row_sp col_sp
		list(
		list("lr" "string" lr)
		list("wr" "string" wr)
		list("lc" "string" lc)
		list("wc" "string" wc)
		list("cap_finger" "int" cap_finger)
		list("w_power" "float" w_power)
		list("lp_space" "float" lp_space)
		list("wp_space" "float" wp_space)
		list("vdd_top" "float" vdd_top)
		list("vdd_down" "float" vdd_down)
		list("vdd_right" "float" vdd_right)
		list("vdd_left" "float" vdd_left)
		list("height" "float" height)
		list("y_spacing" "float" y_spacing)
		list("LineW" "float" LineW)
		) ; close list
	)

)/*end of let*/
)/*end of pcDefinePCell*/
