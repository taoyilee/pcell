;;; CDF GENERATION OF tg_inv

strCellName="ind_single";   The Cell Name is called inductor

cellId = ddGetObj(strLibName strCellName)
if(g_cdfDataId = cdfGetBaseCellCDF(cellId)
then
        ret = cdfDeleteCDF(g_cdfDataId)
        fprintf(stderr "*** CDF of %L deleted (%L)\n" strCellName ret)
)

g_cdfDataId = cdfCreateBaseCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)
cdfCreateParam(g_cdfDataId ?name "OD" ?type "float" ?defValue 50.0 	?prompt "Outer Diameter" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "LEAD" ?type "float" ?defValue 10.0	?prompt "Lead Length" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "OPENING" ?type "float" ?defValue 5.0	?prompt "Lead Opening" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "W" ?type "float" ?defValue 2.0 	?prompt "Line Width" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "S" ?type "float" ?defValue 2.0 	?prompt "Spacing" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "NT_N" ?type "boolean" ?defValue nil ?prompt "Native N-TYPE doping" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "strName" ?type "string" ?defValue "ind_sym" ?prompt "instance name" ?display "t" ?editable "nil" 
	?storeDefault nil ?parseAsCEL "no"  ?callback "")
cdfCreateParam(g_cdfDataId ?name "L1" ?type "string" ?defValue "488p" ?prompt "Main Inductance" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "R1" ?type "string" ?defValue "2.1305" ?prompt "R1" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "L2" ?type "string" ?defValue "1.4836n" ?prompt "Secondary Inductance" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "R2" ?type "string" ?defValue "11.904" ?prompt "R2" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "C12" ?type "string" ?defValue "14.67f" ?prompt "C12" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS1" ?type "string" ?defValue "17.67f" ?prompt "CS1" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS3" ?type "string" ?defValue "17.824f" ?prompt "CS3" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "RS5" ?type "string" ?defValue "3.427k" ?prompt "RS5" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS5" ?type "string" ?defValue "2.32f" ?prompt "CS5" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "RS7" ?type "string" ?defValue "3.36k" ?prompt "RS7" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS7" ?type "string" ?defValue "2.5f" ?prompt "CS7" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")


g_cdfDataId->simInfo = list( nil )
g_cdfDataId->simInfo->auCdl = '( nil
        dollarEqualParams nil
        dollarParams      nil
        modelName         "ind_sym"
        namePrefix        "L"
        propMapping       nil
        termOrder         (plus minus vss)
        componentName     ind_single
        instParameters    (OD W S L1)
        otherParameters   nil
        netlistProcedure  ansCdlSubcktCall
    )

 g_cdfDataId->paramLabelSet = "OD W S L1 R1 L2 R2 C12 CS1 CS5 RS5 CS3 CS7 RS7"
cdfSaveCDF( g_cdfDataId )

;libpath = dbFullLibPath(strLibName)
;cdfDump(strLibName strcat(libpath "/" strCellName ".cdf") ?cellName strCellName ?level 'base ?edit nil)
