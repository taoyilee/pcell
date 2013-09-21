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


strLibName="RFVLSI_N65";        My Library name is my student id
strCellName="bypar"
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

cdfCreateParam(g_cdfDataId ?name "byp" ?type "string" ?defValue "byp2x"
?prompt "Bypass Master" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no"  ?callback "")

cdfCreateParam(g_cdfDataId ?name "cols1" ?type "int" ?defValue 3
?prompt "Cap Columns" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "rows1" ?type "int" ?defValue 3
?prompt "Cap Rows" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")

cdfCreateParam(g_cdfDataId ?name "w_power" ?type "float" ?defValue 1.0
?prompt "W Power" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "wp_space" ?type "float" ?defValue 0.5
?prompt "WP Spacing" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "lp_space" ?type "float" ?defValue 0.5
?prompt "LP Spacing" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "y_spacing" ?type "float" ?defValue 0.58
?prompt "R/C Spacing" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "voil_l" ?type "float" ?defValue 0.2
?prompt "Void Length" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "LineW" ?type "float" ?defValue 1.0
?prompt "Line Width" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "cap_finger" ?type "int" ?defValue 2
?prompt "Cap Finger" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")

cdfCreateParam(g_cdfDataId ?name "vdd_left" ?type "float" ?defValue 0.0
?prompt "VDD Retract (Left)" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "vdd_right" ?type "float" ?defValue 0.0
?prompt "VDD Retract (Right)" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "vdd_top" ?type "float" ?defValue 0.0
?prompt "VDD Retract (Top)" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "vdd_down" ?type "float" ?defValue 0.0
?prompt "VDD Retract (Down)" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")

cdfSaveCDF( g_cdfDataId )

