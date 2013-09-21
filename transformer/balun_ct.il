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
	
strCellName="balun_ct"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD     "float" 190.0)
    (WI     "float" 4.0)
    (WO     "float" 2.0)
    (LOP    "float" 10.0)
    (ROP    "float" 7.0)
    (LEAD   "float" 20.0)
    (LEADDYI    "float" 0.0)
    (LEADDYO    "float" 0.0)
    (S  "float" 2.05)
    (DIVO "float" 3.35)
    (DIVI "float" 3.3)
    (dummy "boolean" t)
    (DUMMYL "string" "RFVLSI")
    (balun_str "string" "balun_ct")
    (NT_N "boolean" t)
)
let((),
	dbCreateParamInst(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "balun" "layout" )
		nil 0:0 "R0" 1  
		list(
			list("OD" 	"float" 	OD) 
			list("WI"	"float" 	WI)	
			list("WO"	"float" 	WO)	
			list("S"	"float"		S) 
			list("DIVI"	"float"	DIVI) 
			list("DIVO"	"float"	DIVO) 
			list("LOP"	"float" LOP) 
			list("ROP"	"float" ROP) 
      		list("LEAD"   "float" LEAD) 
      		list("LEADDYI"   "float" LEADDYI) 
        	list("LEADDYO"   "float" LEADDYO) 
        	list("dummy"   "boolean" dummy)
        	list("DUMMYL"   "string" DUMMYL)
			list("balun_str" "string" balun_str)
			list("NT_N" 	"boolean"	NT_N)
		))
    dbCreateLabel(pcCellView, list(DUMMYL, "dummy1"), OD-WI/2-WO-S:0, "CT", "centerCenter", "R0", "roman", WO)
    dbCreateRect(pcCellView, list(DUMMYL, "dummy1"), list(OD-WI-WO-S:-WI/2 OD-WO-S:WI/2))

)/*end of let*/
)/*end of pcDefinePCell*/

