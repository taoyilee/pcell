;;; CDF GENERATION OF tg_inv
strLibName="RFVLSI_N65";        My Library name is my student id
strCellName="ind";   The Cell Name is called inductor

cellId = ddGetObj(strLibName strCellName)
if(g_cdfDataId = cdfGetBaseCellCDF(cellId)
then
        ret = cdfDeleteCDF(g_cdfDataId)
        fprintf(stderr "*** CDF of %L deleted (%L)\n" strCellName ret)
)

g_cdfDataId = cdfCreateBaseCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)
cdfCreateParam(g_cdfDataId ?name "L1" ?type "string" ?defValue "1n" ?prompt "Main Inductance" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "L2" ?type "string" ?defValue "1n" ?prompt "Secondary Inductance" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "R1" ?type "string" ?defValue "3.0" ?prompt "R1" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "R2" ?type "string" ?defValue "3.0" ?prompt "R2" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "RS5" ?type "string" ?defValue "3.0" ?prompt "RS5" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "CS1" ?type "string" ?defValue "3f" ?prompt "CS1" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS5" ?type "string" ?defValue "3f" ?prompt "CS5" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")


cdfCreateParam(g_cdfDataId ?name "OD" ?type "float" ?defValue 100.0 	?prompt "Outer Diameter" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "OPEN" ?type "float" ?defValue 5.0 	?prompt "Lead Opening" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "W" ?type "float" ?defValue 2.0 	?prompt "Line Width" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "S" ?type "float" ?defValue 2.0 	?prompt "Spacing" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "NT" ?type "int" ?defValue 2 	?prompt "Turns" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "DIV" ?type "float" ?defValue 3.2 	?prompt "Shape Fine Tuning" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "LEAD" ?type "float" ?defValue 20.0	?prompt "Lead Length" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "TOP_ME" ?type "cyclic" ?defValue "9" ?choices list("1" "2" "3" "4" "5" "6" "7" "8" "9")
?prompt "Top Metal" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "BTM_ME" ?type "cyclic" ?defValue "9" ?choices list("1" "2" "3" "4" "5" "6" "7" "8" "9")
?prompt "Bottom Metal" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "yes" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "DUMMYL" ?type "string" ?defValue "RFVLSI" ?prompt "Dummy Layer Name" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "textlbl" ?type "string" ?defValue "ind" ?prompt "Text Label" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "NT_N" ?type "boolean" ?defValue nil ?prompt "Native N-TYPE doping" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")

cdfCreateParam(g_cdfDataId ?name "dummy" ?type "boolean" ?defValue t ?prompt "Enable Dummy" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "INDDMYP" ?type "cyclic" ?defValue "drawing" ?choices list("drawing" "dummy1"  "dummy2"  "dummy3"  "dummy4"  "dummy5")
?prompt "Main Dummy Purpose" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "PINP" ?type "cyclic" ?defValue "dummy1" ?choices list("drawing" "dummy1"  "dummy2"  "dummy3"  "dummy4"  "dummy5")
?prompt "Port 1 Dummy Purpose" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")


cdfCreateParam(g_cdfDataId ?name "TEXTDMYP" ?type "cyclic" ?defValue "drawing" ?choices list("drawing" "dummy1"  "dummy2"  "dummy3"  "dummy4"  "dummy5")
?prompt "Text Dummy Purpose" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")


g_cdfDataId->simInfo = list( nil )
g_cdfDataId->simInfo->auCdl = '( nil
        dollarEqualParams nil
        dollarParams      nil
        modelName         "ind"
        namePrefix        "L"
        propMapping       nil
        termOrder         (plus minus)
        componentName     ind
        instParameters    (OD NT W S L1)
        otherParameters   nil
        netlistProcedure  ansCdlSubcktCall
    )

cdfSaveCDF( g_cdfDataId )

;libpath = dbFullLibPath(strLibName)
;cdfDump(strLibName strcat(libpath "/" strCellName ".cdf") ?cellName strCellName ?level 'base ?edit nil)
