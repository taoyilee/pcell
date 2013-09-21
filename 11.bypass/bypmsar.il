strCellName="bypmsar";	The Cell Name is called Inductor
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(rows1 "int" 3) 
	(cols1 "int" 3) 
	(invert "boolean" nil) 
)
let((row_sp col_sp m_bypms2x),
	row_sp = 6.0
	col_sp = 15.0
	m_bypms2x = dbOpenCellViewByType(pcCellView~>lib "bypms2x" "layout")
	if(invert
	then
		if(evenp(rows1)
		then
			dbCreateParamSimpleMosaic(pcCellView m_bypms2x
			"M0"  0:0.05 "MX" rows1/2 cols1 -2*row_sp col_sp
			list(		) ; close list
			)
	
			dbCreateParamSimpleMosaic(pcCellView m_bypms2x
			"M1"  0:row_sp "R0" rows1/2 cols1 2*row_sp col_sp
			list(		) ; close list
			)
		else
			dbCreateParamSimpleMosaic(pcCellView m_bypms2x
		    "M2"  0:0.05 "MX" (rows1-1)/2+1 cols1 -2*row_sp col_sp
		    list(       ) ; close list
		    )
			if(rows1>1
			then
				dbCreateParamSimpleMosaic(pcCellView m_bypms2x
			    "M3"  0:row_sp "R0" (rows1-1)/2 cols1 2*row_sp col_sp
			    list(       ) ; close list
			    )
			)
		)
	else
		if(evenp(rows1)
        then
            dbCreateParamSimpleMosaic(pcCellView m_bypms2x
            "M0"  0:0 "R0" rows1/2 cols1 2*row_sp col_sp
            list(       ) ; close list
            )

            dbCreateParamSimpleMosaic(pcCellView m_bypms2x
            "M1"  0:row_sp+0.05 "MX" rows1/2 cols1 -2*row_sp col_sp
            list(       ) ; close list
            )
        else
            dbCreateParamSimpleMosaic(pcCellView m_bypms2x
            "M2"  0:0 "R0" (rows1-1)/2+1 cols1 2*row_sp col_sp
            list(       ) ; close list
            )
            if(rows1>1
            then
                dbCreateParamSimpleMosaic(pcCellView m_bypms2x
                "M3"  0:row_sp+0.05 "MX" (rows1-1)/2 cols1 -2*row_sp col_sp
                list(       ) ; close list
                )
            )
        )
	)

)/*end of let*/
)/*end of pcDefinePCell*/
