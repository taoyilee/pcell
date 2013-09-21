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
	
strCellName="xfm_highk_ct"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD     "float" 150.0)
    (WI     "float" 12.0)
    (WO     "float" 3.0)
    (LOP    "float" 15.0)
    (ROP    "float" 7.0)
    (W_INC  "float" 2.0)
    (LEAD   "float" 20.0)
    (LEADW   "float" 10.0)
    (LEADDYI    "float" 0.0)
    (LEADDYO    "float" 0.0)
    (S  "float" 2.05)
    (en_dmy "boolean" t)
    (en_NTN "boolean" t)
    (balun_str "string" "xfm_highk_ct")

)
let((),
	dbCreateParamInst(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "xfm_highk" "layout" );
		nil 0:0 "R0" 1  
		list(
			list("OD" 	"float" 	OD) 
			list("WI"	"float" 	WI)	
			list("WO"	"float" 	WO)	
			list("S"	"float"		S) 
			list("LOP"	"float" LOP) 
			list("ROP"	"float" ROP) 
			list("W_INC"	"float" W_INC) 
      		list("LEAD"   "float" LEAD) 
      		list("LEADW"   "float" LEADW) 
      		list("LEADDYI"   "float" LEADDYI) 
        	list("LEADDYO"   "float" LEADDYO) 
        	list("en_dmy"   "boolean" en_dmy)
			list("balun_str" "string" balun_str)
			list("en_NTN" 	"boolean"	en_NTN)
		))
    dbCreateLabel(pcCellView, list("RFVLSI", "dummy1"), OD/2-WI/2-WO-S:0, "CT", "centerCenter", "R0", "roman", WO)
    dbCreateRect(pcCellView, list("RFVLSI", "dummy1"), list(OD/2-WI-WO-S:-WI/2 OD/2-WO-S:WI/2))
))

