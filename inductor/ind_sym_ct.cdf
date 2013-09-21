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

strCellName="ind_sym_ct";   The Cell Name is called inductor

cellId = ddGetObj("RFVLSI_N65" strCellName)
if(g_cdfDataId = cdfGetBaseCellCDF(cellId)
then
        ret = cdfDeleteCDF(g_cdfDataId)
        fprintf(stderr "*** CDF of %L deleted (%L)\n" strCellName ret)
)

g_cdfDataId = cdfCreateBaseCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)
cdfCreateParam(g_cdfDataId ?name "OD" ?type "float" ?defValue 100.0 	?prompt "Outer Diameter" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "W" ?type "float" ?defValue 2.0 	?prompt "Line Width" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "S" ?type "float" ?defValue 2.0 	?prompt "Spacing" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "NT_STR" ?type "cyclic" ?defValue "2" ?choices list("2" "4" "6" "8" "10") ?prompt "Turns" ?display "t" ?editable "t"
    ?storeDefault nil  ?callback "cdfgData->NT->value = atoi(cdfgData->NT_STR->value)" )

cdfCreateParam(g_cdfDataId ?name "NT" ?type "int" ?defValue 2 ?prompt "Turns(int)" ?display "nil" ?editable "nil" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "LEAD" ?type "float" ?defValue 10.0	?prompt "Lead Length" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "OPENING" ?type "float" ?defValue 10.0	?prompt "Lead Opening" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "NT_N" ?type "boolean" ?defValue nil ?prompt "Native N-TYPE doping" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "L12" ?type "string" ?defValue "1p" ?prompt "Main Inductance" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "L23" ?type "string" ?defValue "1p" ?prompt "Secondary Inductance" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "k" ?type "string" ?defValue "0.75" ?prompt "Coupling Coeffcient" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?parseAsNumber "yes" ?callback "")
	
cdfCreateParam(g_cdfDataId ?name "R12" ?type "string" ?defValue "3.0" ?prompt "R12" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "R23" ?type "string" ?defValue "3.0" ?prompt "R23" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "C12" ?type "string" ?defValue "3f" ?prompt "C12" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "C13" ?type "string" ?defValue "3f" ?prompt "C13" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
	
cdfCreateParam(g_cdfDataId ?name "C23" ?type "string" ?defValue "3f" ?prompt "C23" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "C11" ?type "string" ?defValue "5f" ?prompt "C11" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "C22" ?type "string" ?defValue "5f" ?prompt "C22" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "C33" ?type "string" ?defValue "5f" ?prompt "C33" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "CS1" ?type "string" ?defValue "1f" ?prompt "CS1" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "RS1" ?type "string" ?defValue "1k" ?prompt "RS1" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "CS2" ?type "string" ?defValue "3f" ?prompt "CS2" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
	
cdfCreateParam(g_cdfDataId ?name "RS2" ?type "string" ?defValue "1k" ?prompt "RS2" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
	
cdfCreateParam(g_cdfDataId ?name "CS3" ?type "string" ?defValue "3f" ?prompt "CS3" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "RS3" ?type "string" ?defValue "1k" ?prompt "RS3" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "L12i" ?type "string" ?defValue "1p" ?prompt "L12i" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
	
cdfCreateParam(g_cdfDataId ?name "R12i" ?type "string" ?defValue "3.0" ?prompt "R12i" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
	
cdfCreateParam(g_cdfDataId ?name "L23i" ?type "string" ?defValue "1p" ?prompt "L23i" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "R23i" ?type "string" ?defValue "3.0" ?prompt "R23i" ?display "t" ?editable "t" 
	?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

g_cdfDataId->simInfo = list( nil )
g_cdfDataId->simInfo->auCdl = '( nil
        dollarEqualParams nil
        dollarParams      nil
        modelName         "ind_sym_ct"
        namePrefix        "L"
        propMapping       nil
        termOrder         (plus minus ct vss)
        componentName     ind_sym_ct
        instParameters    (OD NT W S)
        otherParameters   nil
        netlistProcedure  ansCdlSubcktCall
    )


cdfSaveCDF( g_cdfDataId )

;libpath = dbFullLibPath(strLibName)
;cdfDump(strLibName strcat(libpath "/" strCellName ".cdf") ?cellName strCellName ?level 'base ?edit nil)

