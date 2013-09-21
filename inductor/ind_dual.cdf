/*  TYLEE PCELL
    Copyright (C) 2013  Tao-Yi Lee (tylee@ieee.org)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

strCellName="ind_dual";   The Cell Name is called inductor

cellId = ddGetObj(strLibName strCellName)
if(g_cdfDataId = cdfGetBaseCellCDF(cellId)
then
        ret = cdfDeleteCDF(g_cdfDataId)
        fprintf(stderr "*** CDF of %L deleted (%L)\n" strCellName ret)
)

g_cdfDataId = cdfCreateBaseCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)
cdfCreateParam(g_cdfDataId ?name "OD" ?type "float" ?defValue 50.0 	?prompt "Outer Diameter" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "W" ?type "float" ?defValue 2.0 	?prompt "Line Width" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "S" ?type "float" ?defValue 2.0 	?prompt "Spacing" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "GND_ME_STR" ?type "cyclic" ?defValue "3" ?choices list("1" "2" "3" "4" "5" "6" "7" "8" "9") ?prompt "Ground Metal" ?display "t" ?editable "t" 
	?storeDefault nil  ?callback "cdfgData->GND_ME->value = atoi(cdfgData->GND_ME_STR->value)" )
cdfCreateParam(g_cdfDataId ?name "GND_ME" ?type "int" ?defValue 3 ?prompt "Turns(int)" ?display "nil" ?editable "nil" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "NT_STR" ?type "cyclic" ?defValue "2" ?choices list("2" "4" "6" "8" "10") ?prompt "Turns" ?display "t" ?editable "t" 
	?storeDefault nil  ?callback "cdfgData->NT->value = atoi(cdfgData->NT_STR->value)" )

cdfCreateParam(g_cdfDataId ?name "NT" ?type "int" ?defValue 2 ?prompt "Turns(int)" ?display "nil" ?editable "nil" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "NT_N" ?type "boolean" ?defValue nil ?prompt "Native N-TYPE doping" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "short1" ?type "boolean" ?defValue nil ?prompt "Short Port 1" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "gnd1" ?type "boolean" ?defValue nil ?prompt "GND Port 1" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "short2" ?type "boolean" ?defValue nil ?prompt "Short Port 2" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "gnd2" ?type "boolean" ?defValue nil ?prompt "GND Port 2" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sig1" ?type "boolean" ?defValue nil ?prompt "SIGNAL Port 1" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sig2" ?type "boolean" ?defValue nil ?prompt "SIGNAL Port 2" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "LEAD" ?type "float" ?defValue 10.0	?prompt "Lead Length" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "SS_Gap1" ?type "float" ?defValue 3.0	
	?prompt "Signal to Signal Gap 1" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "SG_Gap1" ?type "float" ?defValue 3.0	
	?prompt "Signal to Grounp Gap 1" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "SS_Gap2" ?type "float" ?defValue 3.0	
	?prompt "Signal to Signal Gap 2" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "SG_Gap2" ?type "float" ?defValue 3.0	
	?prompt "Signal to Grounp Gap 2" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "strName" ?type "string" ?defValue "ind_dual" ?prompt "instance name" ?display "nil" ?editable "nil" 	?storeDefault nil ?parseAsCEL "no"  ?callback "")



g_cdfDataId->simInfo = list( nil )
g_cdfDataId->simInfo->auCdl = '( nil
        dollarEqualParams nil
        dollarParams      nil
        modelName         "ind_dual"
        namePrefix        "L"
        propMapping       nil
        componentName     ind_dual
        instParameters    (OD NT W S SS_Gap1 SG_Gap1 SS_Gap2 SG_Gap2 )
        otherParameters   nil
        netlistProcedure  ansCdlSubcktCall
    )

cdfSaveCDF( g_cdfDataId )

;libpath = dbFullLibPath(strLibName)
;cdfDump(strLibName strcat(libpath "/" strCellName ".cdf") ?cellName strCellName ?level 'base ?edit nil)
