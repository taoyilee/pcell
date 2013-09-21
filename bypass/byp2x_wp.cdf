strLibName="RFVLSI_N65";        My Library name is my student id
strCellName="byp2x_wp"
cellId = ddGetObj(strLibName strCellName)
if(g_cdfDataId = cdfGetBaseCellCDF(cellId)
then
        ret = cdfDeleteCDF(g_cdfDataId)
        fprintf(stderr "*** CDF of %L deleted (%L)\n" strCellName ret)
)
g_cdfDataId = cdfCreateBaseCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)


cdfCreateParam(g_cdfDataId ?name "wr" ?type "string" ?defValue "0.5u"
?prompt "R Width" ?display "t" ?editable "t" ?storeDefault nil ?parseAsNumber "yes" ?units "lengthMetric" ?parseAsCEL "yes"  ?callback "")
cdfCreateParam(g_cdfDataId ?name "lr" ?type "string" ?defValue "5u"
?prompt "R Length" ?display "t" ?editable "t" ?storeDefault nil ?parseAsNumber "yes" ?units "lengthMetric" ?parseAsCEL "yes"  ?callback "")
cdfCreateParam(g_cdfDataId ?name "wc" ?type "string" ?defValue "7u"
?prompt "C Width" ?display "t" ?editable "t" ?storeDefault nil ?parseAsNumber "yes" ?units "lengthMetric" ?parseAsCEL "yes"  ?callback "")
cdfCreateParam(g_cdfDataId ?name "lc" ?type "string" ?defValue "3.2u"
?prompt "C Length" ?display "t" ?editable "t" ?storeDefault nil ?parseAsNumber "yes" ?units "lengthMetric" ?parseAsCEL "yes"  ?callback "")


cdfCreateParam(g_cdfDataId ?name "y_spacing" ?type "float" ?defValue 0.9
?prompt "R/C Spacing" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "l_v" ?type "float" ?defValue 1.0
?prompt "Void Length" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "l_f" ?type "float" ?defValue 0.5
?prompt "Line Width" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")


cdfCreateParam(g_cdfDataId ?name "cap_finger" ?type "int" ?defValue 2
?prompt "Finger of MOSCAP" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "w_power" ?type "float" ?defValue 1.0
?prompt "Power Line Width" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "lp_space" ?type "float" ?defValue 0.5
?prompt "lp_space" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "wp_space" ?type "float" ?defValue 0.5
?prompt "wp_space" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")


cdfSaveCDF( g_cdfDataId )

