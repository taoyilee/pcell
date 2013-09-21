;;; CDF GENERATION OF tg_inv

strCellName="ind_ssLpL";   The Cell Name is called inductor

cellId = ddGetObj(strLibName strCellName)
if(g_cdfDataId = cdfGetBaseCellCDF(cellId)
then
        ret = cdfDeleteCDF(g_cdfDataId)
        fprintf(stderr "*** CDF of %L deleted (%L)\n" strCellName ret)
)

g_cdfDataId = cdfCreateBaseCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)
cdfCreateParam(g_cdfDataId ?name "od1_str" ?type "string" ?defValue "50u" 	?prompt "Outer Diameter (pL)" ?display "t" ?editable "t" 
		?storeDefault nil  ?callback "" ?parseAsCEL "yes" ?units "lengthMetric" ?parseAsNumber "yes") 
cdfCreateParam(g_cdfDataId ?name "w1_str" ?type "string" ?defValue "2u" 	?prompt "Width (pL)" ?display "t" ?editable "t" 
		?storeDefault nil  ?callback "" ?parseAsCEL "yes" ?units "lengthMetric" ?parseAsNumber "yes") 
cdfCreateParam(g_cdfDataId ?name "od2_str" ?type "string" ?defValue "50u" 	?prompt "Outer Diameter (sL)" ?display "t" ?editable "t" 
		?storeDefault nil  ?callback "" ?parseAsCEL "yes" ?units "lengthMetric" ?parseAsNumber "yes") 
cdfCreateParam(g_cdfDataId ?name "w2_str" ?type "string" ?defValue "2u" 	?prompt "Width (sL)" ?display "t" ?editable "t" 
		?storeDefault nil  ?callback "" ?parseAsCEL "yes" ?units "lengthMetric" ?parseAsNumber "yes") 

cdfCreateParam(g_cdfDataId ?name "SY" ?type "float" ?defValue 10.0 	?prompt "Spacing Betwwen L" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "GND_ME_STR" ?type "cyclic" ?defValue "2" ?choices list("1" "2" "3" "4" "5" "6" "7" "8") ?prompt "Ground Metal" ?display "t" ?editable "t" 
	?storeDefault nil  ?callback "cdfgData->GND_ME->value = atoi(cdfgData->GND_ME_STR->value)" )
cdfCreateParam(g_cdfDataId ?name "GND_ME" ?type "int" ?defValue 2 ?prompt "Turns(int)" ?display "nil" ?editable "nil" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "NT_N" ?type "boolean" ?defValue nil ?prompt "Native N-TYPE doping" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "LEAD" ?type "float" ?defValue 10.0	?prompt "Lead Length" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "OPENING" ?type "float" ?defValue 5.0	?prompt "Lead Opening" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "strName" ?type "string" ?defValue "ind_dualpp" ?prompt "instance name" ?display "nil" ?editable "nil" 
	?storeDefault nil ?parseAsCEL "no"  ?callback "")

cdfCreateParam(g_cdfDataId ?name "pLParam" ?type "boolean" ?defValue nil ?prompt "pL Mdl. Param." ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")

cdfCreateParam(g_cdfDataId ?name "pL1" ?type "string" ?defValue "488p" ?prompt "Main Inductance" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "pR1" ?type "string" ?defValue "2.1305" ?prompt "R1" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "pL2" ?type "string" ?defValue "1.4836n" ?prompt "Secondary Inductance" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "pR2" ?type "string" ?defValue "11.904" ?prompt "R2" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "pC12" ?type "string" ?defValue "14.67f" ?prompt "C12" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "pCS1" ?type "string" ?defValue "17.67f" ?prompt "CS1" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "pCS3" ?type "string" ?defValue "17.824f" ?prompt "CS3" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "pRS5" ?type "string" ?defValue "3.427k" ?prompt "RS5" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "pCS5" ?type "string" ?defValue "2.32f" ?prompt "CS5" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "pRS7" ?type "string" ?defValue "3.36k" ?prompt "RS7" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "pCS7" ?type "string" ?defValue "2.5f" ?prompt "CS7" ?display "cdfgData->pLParam->value" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")


cdfCreateParam(g_cdfDataId ?name "sLParam" ?type "boolean" ?defValue nil ?prompt "sL Mdl. Param." ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sL1" ?type "string" ?defValue "488p" ?prompt "Main Inductance" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sR1" ?type "string" ?defValue "2.1305" ?prompt "R1" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "sL2" ?type "string" ?defValue "1.4836n" ?prompt "Secondary Inductance" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sR2" ?type "string" ?defValue "11.904" ?prompt "R2" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "sC12" ?type "string" ?defValue "14.67f" ?prompt "C12" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sCS1" ?type "string" ?defValue "17.67f" ?prompt "CS1" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sCS3" ?type "string" ?defValue "17.824f" ?prompt "CS3" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "sRS5" ?type "string" ?defValue "3.427k" ?prompt "RS5" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sCS5" ?type "string" ?defValue "2.32f" ?prompt "CS5" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "sRS7" ?type "string" ?defValue "3.36k" ?prompt "RS7" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sCS7" ?type "string" ?defValue "2.5f" ?prompt "CS7" ?display "cdfgData->sLParam->value" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")


g_cdfDataId->simInfo = list( nil )
g_cdfDataId->simInfo = list( nil )
g_cdfDataId->simInfo->auCdl = '( nil
        dollarEqualParams nil
        dollarParams      nil
        modelName         "ind_ssLpL"
        namePrefix        "L"
        propMapping       nil
        termOrder         (plus minus ctp ctn vss)
        componentName     ind_ssLpL
        instParameters    (od1_str w1_str od2_str w2_str)
        otherParameters   nil
        netlistProcedure  ansCdlSubcktCall
    )


g_cdfDataId->paramLabelSet = "od1_str od2_str w1_str w2_str sL1 pL1 sR1 pR1"
cdfSaveCDF( g_cdfDataId )

;libpath = dbFullLibPath(strLibName)
;cdfDump(strLibName strcat(libpath "/" strCellName ".cdf") ?cellName strCellName ?level 'base ?edit nil)
