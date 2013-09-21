/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */

strCellName="indma";	The Cell Name is called RFVLSI_N65
strViewName="layout";	This is a virtuoso layout
cellId = ddGetObj(strLibName strCellName)
g_cdfDataId = cdfCreateUserCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)

cdfCreateParam(g_cdfDataId ?name "OD" ?type "float" ?defValue 8.0
?prompt "Outer Diameter" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "W" ?type "float" ?defValue 12.0
?prompt "Line Width" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "NT" ?type "int" ?defValue 2
?prompt "Turns" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "ME_JMP" ?type "int" ?defValue 9
?prompt "Bottom Metal" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")

cdfCreateParam(g_cdfDataId ?name "HIGHEST_METAL_IS_AP" ?type "boolean" ?defValue nil
?prompt "Top Metal is AP(RDL)" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "ME_TOP" ?type "int" ?defValue 9
?prompt "Top Metal" ?display "cdfgData->HIGHEST_METAL_IS_AP->value == nil" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "DIV" ?type "float" ?defValue 3.5
?prompt "Shape fine tune factor" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "S" ?type "float" ?defValue 12.0
?prompt "Line Spacing" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "LEAD" ?type "float" ?defValue 12.0
?prompt "Lead length" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")


cdfCreateParam(g_cdfDataId ?name "dmy_flag" ?type "radio" ?defValue "OFF" ?parseAsNumber nil
?choices list("ON" "OFF") ?prompt "Dummy Control" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "INDDMY" ?type "string" ?defValue "RFVLSI"
?prompt "INDDMY" ?display "cdfgData->dmy_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "INDDMYP" ?type "string" ?defValue "drawing"
?prompt "INDDMY" ?display "cdfgData->dmy_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "P1DMY" ?type "string" ?defValue "RFVLSI"
?prompt "INDDMY" ?display "cdfgData->dmy_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "P1DMYP" ?type "string" ?defValue "dummy"
?prompt "INDDMY" ?display "cdfgData->dmy_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "P2DMY" ?type "string" ?defValue "RFVLSI"
?prompt "INDDMY" ?display "cdfgData->dmy_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "P2DMYP" ?type "string" ?defValue "dummy1"
?prompt "INDDMY" ?display "cdfgData->dmy_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "TEXTDMY" ?type "string" ?defValue "RFVLSI"
?prompt "INDDMY" ?display "cdfgData->dmy_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "TEXTDMYP" ?type "string" ?defValue "dummy4"
?prompt "INDDMY" ?display "cdfgData->dmy_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")



cdfCreateParam(g_cdfDataId ?name "adv_flag" ?type "radio" ?defValue "OFF" ?parseAsNumber nil
?choices list("ON" "OFF") ?prompt "Display advanced parameters" ?display "t"
?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "METAL_PREFIX" ?type "string" ?defValue "M"
?prompt "Prefix of Metal" ?display "cdfgData->adv_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA_PREFIX" ?type "string" ?defValue "VIA"
?prompt "Prefix of VIA" ?display "cdfgData->adv_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "AP_NAME" ?type "string" ?defValue "AP"
?prompt "AP Name" ?display "cdfgData->adv_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "RV_NAME" ?type "string" ?defValue "RV"
?prompt "RV Name" ?display "cdfgData->adv_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")

cdfCreateParam(g_cdfDataId ?name "tweak_flag" ?type "radio" ?defValue "OFF" ?parseAsNumber nil
?choices list("ON" "OFF") ?prompt "Display tweaking parameters" ?display "t"
?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA1_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA1 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA2_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA2 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA3_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA3 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA4_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA4 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA5_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA5 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA6_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA6 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA7_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA7 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA8_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA8 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA9_en_tweak" ?type "float" ?defValue 0.0
?prompt "VIA9 Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "RV_en_tweak" ?type "float" ?defValue 0.0
?prompt "RV Enclosure Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA1_tweak" ?type "float" ?defValue 0.0
?prompt "VIA1 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA2_tweak" ?type "float" ?defValue 0.0
?prompt "VIA2 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA3_tweak" ?type "float" ?defValue 0.0
?prompt "VIA3 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA4_tweak" ?type "float" ?defValue 0.0
?prompt "VIA4 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA5_tweak" ?type "float" ?defValue 0.0
?prompt "VIA5 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA6_tweak" ?type "float" ?defValue 0.0
?prompt "VIA6 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA7_tweak" ?type "float" ?defValue 0.0
?prompt "VIA7 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA8_tweak" ?type "float" ?defValue 0.0
?prompt "VIA8 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "VIA9_tweak" ?type "float" ?defValue 0.0
?prompt "VIA9 Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
cdfCreateParam(g_cdfDataId ?name "RV_tweak" ?type "float" ?defValue 0.0
?prompt "RV Width Tweak" ?display "cdfgData->tweak_flag->value == \"ON\"" ?editable "t" ?storeDefault nil ?parseAsCEL "no")
libpath = dbFullLibPath(strLibName)
cdfDump(strLibName strcat(libpath "/" strCellName ".cdf") ?cellName strCellName ?level 'user ?edit nil)
fptr = outfile(strcat(libpath "/libInit.il") "a")
fprintf(fptr "load(\"%s\")" strcat(libpath "/" strCellName ".cdf"))
close(fptr)
