;;; CDF GENERATION OF tg_inv
strCellName="ind_sym_cct4T";   The Cell Name is called inductor

cellId = ddGetObj(strLibName strCellName)
if(g_cdfDataId = cdfGetBaseCellCDF(cellId)
then
        ret = cdfDeleteCDF(g_cdfDataId)
        fprintf(stderr "*** CDF of %L deleted (%L)\n" strCellName ret)
)
g_cdfDataId = cdfCreateBaseCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)
cdfCreateParam(g_cdfDataId ?name "OD" ?type "float" ?defValue 100.0 	?prompt "Outer Diameter" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "W" ?type "float" ?defValue 3.0 	?prompt "Line Width" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "S" ?type "float" ?defValue 2.0 	?prompt "Spacing" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "LEAD" ?type "float" ?defValue 20.0	?prompt "Lead Length" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "OPENING" ?type "float" ?defValue 15.0	?prompt "Lead Opening" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "OPENCT" ?type "float" ?defValue 10.0	?prompt "Lead Opening (CT)" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "L12" ?type "string" ?defValue "1n" ?prompt "L12" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "R12" ?type "string" ?defValue "3.0" ?prompt "R12" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "L34" ?type "string" ?defValue "1n" ?prompt "L34" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "R34" ?type "string" ?defValue "3.0" ?prompt "R34" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "kf" ?type "string" ?defValue "0.75" ?prompt "k Factor" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "subs_model" ?type "radio" ?defValue "OFF"
?prompt "Substrate Parameters" ?display "t" ?editable "t" ?storeDefault nil ?choices list("ON" "OFF") ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "RS1" ?type "string" ?defValue "3.0" ?prompt "RS1" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "RS2" ?type "string" ?defValue "3.0" ?prompt "RS2" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "RS3" ?type "string" ?defValue "3.0" ?prompt "RS3" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "RS4" ?type "string" ?defValue "3.0" ?prompt "RS4" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS1" ?type "string" ?defValue "3f" ?prompt "CS1" ?display "cdfgData->subs_model->value == \"ON\""  ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS2" ?type "string" ?defValue "3f" ?prompt "CS2" ?display "cdfgData->subs_model->value == \"ON\""  ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS3" ?type "string" ?defValue "3f" ?prompt "CS3" ?display "cdfgData->subs_model->value == \"ON\""  ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS4" ?type "string" ?defValue "3f" ?prompt "CS4" ?display "cdfgData->subs_model->value == \"ON\""  ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C11" ?type "string" ?defValue "3f" ?prompt "C11" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C22" ?type "string" ?defValue "3f" ?prompt "C22" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C33" ?type "string" ?defValue "3f" ?prompt "C33" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C44" ?type "string" ?defValue "3f" ?prompt "C44" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C12" ?type "string" ?defValue "3f" ?prompt "C12" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C13" ?type "string" ?defValue "3f" ?prompt "C13" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C14" ?type "string" ?defValue "3f" ?prompt "C14" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C23" ?type "string" ?defValue "3f" ?prompt "C23" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C24" ?type "string" ?defValue "3f" ?prompt "C24" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "C34" ?type "string" ?defValue "3f" ?prompt "C34" ?display "cdfgData->subs_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "skin_model" ?type "radio" ?defValue "OFF"
?prompt "Skin Effect Params." ?display "t" ?editable "t" ?storeDefault nil ?choices list("ON" "OFF") ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "L12i" ?type "string" ?defValue "1n" ?prompt "L12i" ?display "cdfgData->skin_model->value == \"ON\""  ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "R12i" ?type "string" ?defValue "10" ?prompt "R12i" ?display "cdfgData->skin_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "L34i" ?type "string" ?defValue "1n" ?prompt "L34i" ?display "cdfgData->skin_model->value == \"ON\""  ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "R34i" ?type "string" ?defValue "10" ?prompt "R34i" ?display "cdfgData->skin_model->value == \"ON\"" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "oparams" ?type "radio" ?defValue "OFF"
	?prompt "Other Parameters" ?display "t" ?editable "t" ?storeDefault nil ?choices list("ON" "OFF") ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "NT_N" ?type "boolean" ?defValue nil 
	?prompt "Native N-TYPE doping" ?display "cdfgData->oparams->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "dummy" ?type "boolean" ?defValue t 
	?prompt "Enable Dummy" ?display "cdfgData->oparams->value == \"ON\"" ?editable "t" ?storeDefault nil  ?callback "")
g_cdfDataId->simInfo = list( nil )
g_cdfDataId->simInfo->auCdl = '( nil
        dollarEqualParams nil
        dollarParams      nil
        modelName         "ind_sym_cct4T"
        namePrefix        "L"
        propMapping       nil
        termOrder         (plus minus ctp ctn vss)
        componentName     ind_sym_cct4T
        instParameters    (OD W S L1A L1B)
        otherParameters   nil
        netlistProcedure  ansCdlSubcktCall
    )
cdfSaveCDF( g_cdfDataId )
