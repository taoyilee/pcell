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

strCellName="base_xfm_highk_pri"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 150.0)  ; Inductor total width
	(WI	"float" 5.0)	
	(WO	"float" 3.0)	
	(M8_S	"float" 3.0)	
	(S	"float"	2.0) 
	(B_TK	"float"	0.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADW 	"float" 10.0)	
	(LEADDYO 	"float" 0.0)	
	(A_TK	"float"	0.0) 
	(ROP "float"	10.0) 
	(LOP "float"	4.0) 
	(W_INC "float"	4.0) 
	(en_dmy "boolean"	t) 
	(en_NTN "boolean"	nil) 
	(en_HighK "boolean"	t)
	(text "string"	"xfm") 
)
let((PI PO master param masterc m_base_oct_fill),
	PI = WI + S
	PO = WO + S	
	/* Thin Line (Outer) typ. connected to PAD */
	/* AC Current only */
	master = dbOpenCellViewByType(pcCellView~>lib "base_highk_ud" "layout" );
	m_base_oct_fill = dbOpenCellViewByType(pcCellView~>lib "base_oct_fill" "layout" );

    dbCreateParamInst(pcCellView m_base_oct_fill nil 0:0 "R0" 1 /* outer turn */
    list(
		list("OD"     "float" OD)  ; Inductor total width
	    list("layer" "string" "RFVLSI")
	    list("purp" "string"  "drawing")
	))

    dbCreateParamInst(pcCellView m_base_oct_fill nil 0:0 "R0" 1 /* outer turn */
    list(
		list("OD"     "float" OD)  ; Inductor total width
	    list("layer" "string" "RFVLSI_LVS")
	    list("purp" "string"  "dummy9")
	))


    dbCreateParamInst(pcCellView master nil 0:0 "R0" 1 /* outer turn */
    list(
					list("OD" "float" OD)  
	    			list("WO"  "float" WO)
	    			list("WI"  "float" WI)
	    			list("W_INC"  "float" W_INC)
				    list("S"  "float" S)
				    list("LOP" "float" S + WI/2 + WO)
				    list("ROP" "float" ROP)
				    list("LOP_M8" "float" (LOP+LEADW+MinMetSpacing(8)))
				    list("ROP_M8" "float" ROP)
				    list("LEADDYI"    "float" LEADDYI)
				    list("LEADDYO"    "float" LEADDYO)
				    list("TOP_ME" "string"    "9")
				    list("BTM_ME" "string"    "9")
				    list("via_to_next" "boolean"  nil)
				    list("via_diag" "boolean" nil)
					list("align_left" "boolean"	t) 
					list("bCons" "boolean"	t) 
        ))
    dbCreateParamInst(pcCellView master nil 0:0 "R0" 1 /* inner turn */
    	list(
					list("OD" "float" OD-2*(PI+PO))  
	    			list("WO"  "float" WO)
	    			list("WI"  "float" WI)
	    			list("W_INC"  "float" W_INC)
				    list("S"  "float" S)
				    list("LOP" "float" S + WI/2 + WO)
				    list("ROP" "float" 0.0)
				    list("LOP_M8" "float" LOP+WI+MinMetSpacing(8))
				    list("ROP_M8" "float" 0.0)
				    list("LEADDYI"    "float" LEADDYI)
				    list("LEADDYO"    "float" LEADDYO)
				    list("TOP_ME" "string"    "9")
				    list("BTM_ME" "string"    "9")
					list("align_left" "boolean"	nil) 
        ))
	masterc = dbOpenCellViewByType(pcCellView~>lib "X" "layout" );
	dbCreateParamInst(pcCellView masterc nil (-OD/2+WI/2+WO+S):0 "R0" 1 list(
		list("W"  "float" WO)
	    list("S"  "float" (WI+2*S)) 
	    list("OP"  "float" (2*S+WI+2*WO)) 
	    list("TOP_ME" "int"   9) 
	    list("BTM_ME" "int"   8) 
	))

))
