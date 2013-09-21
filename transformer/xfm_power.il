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
	
strCellName="xfm_power"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 180.0)
	(DOD2 	"float" 5.0)
	(WI 	"float" 13.0)	
	(WO 	"float" 3.0)	
	(ROP 	"float" 7.5)	
	(LEAD 	"float" 20.0)	
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(S 	"float" 3.5) 
	(en_dmy "boolean" t)
	(en_NTN "boolean" t)
	(balun_str "string" "xfm_power")
)
let((PI PO masterp masters masterL masterUD LOP M8_S pi C C2 m_lead_pair m_base_em_gr),
	PI=WI+S	; Line pitch: width + space
	PO=WO+S	; Line pitch: width + space
	M8_S = 3.0
	pi=3.141592
	C=roundtogrid(WO*tan(pi/8))
	C2=roundtogrid(C/sqrt(2))
	LOP = WO+WI/2+S+C2+M8_S
	masterp = dbOpenCellViewByType(pcCellView~>lib "base_xfm_power" "layout" );
	masters = dbOpenCellViewByType(pcCellView~>lib "base_balun_sec" "layout" );
	masterL = dbOpenCellViewByType(pcCellView~>lib "base_lead" "layout" );
	masterUD= dbOpenCellViewByType(pcCellView~>lib "base_ind_under" "layout")
	m_lead_pair = dbOpenCellViewByType(pcCellView~>lib "base_lead_pair" "layout" )	
	m_base_em_gr = dbOpenCellViewByType(pcCellView~>lib "base_em_gr" "layout");
	
	if(en_dmy
	then
		dbCreateLabel(pcCellView, list("RFVLSI","drawing"), 0:0, balun_str, "centerCenter", "R0", "roman", 5.0)
	)

	dbCreateLabel(pcCellView, list("RFVLSI", "dummy6"), 0:-5, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy7"), 0:-2, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy8"), 0:2, sprintf(nil "%L" WI), "centerCenter", "R0", "roman", 2)
	dbCreateLabel(pcCellView, list("RFVLSI", "dummy9"), 0:5, sprintf(nil "%L" WO), "centerCenter", "R0", "roman", 2)
	dbCreateParamInst(pcCellView masterp nil 0:0 "R0" 1  
		list(	; Primary Coil
		list("OD" 	"float" 	OD) ; Inductor total width
		list("DOD2" 	"float" DOD2) ; Inductor total width
		list("WI"	"float" 	WI)	
		list("WO"	"float" 	WO)	
		list("S"	"float"		S) 
		list("LOP"	"float" LOP) 
		list("LEADDYI"   "float" LEADDYI) 
		list("LEADDYO"   "float" LEADDYO) 
		list("TOP_ME" "string" "9")
		list("text" "string" balun_str)
		list("ROP" 	"float"	ROP)
		list("en_NTN" "boolean" en_NTN)
	))

	dbCreateParamInst(pcCellView masters nil 0:0 "R0" 1
		list(	; Secondary Coil
		list("OD"   "float"     OD-2*PO) 
		list("WI"    "float"     WI)
		list("WO"    "float"     WO)
		list("S"    "float"     S)
		list("LEADDYI"   "float" LEADDYI)
		list("LEADDYO"   "float" LEADDYO)
		list("TOP_ME" "string" "9")
		list("text" "string" balun_str)
		list("LOP"  "float" LOP)
	))


	dbCreateParamInst(pcCellView masterUD nil (PO-OD/2):LOP "R90" 1
		list(	; under pass 1
		list("W"   "float" WI)  
		list("WX"   "float" WI)  
		list("S"   "float" 2*S+WO)  
		list("NT"   "int" 1)  
		list("TOP_ME" "string" "9")
		list("BTM_ME" "string" "8")
		list("en_dmy" "boolean" t)
		list("vias" "boolean" t)
		list("top" "boolean" t))
	)
	dbCreateParamInst(pcCellView masterUD nil (PO-OD/2):-LOP-WI "R90" 1 
		list(	; under pass 2
		list("W"   "float" WI)  
		list("WX"   "float" WI)  
		list("S"   "float" 2*S+WO)  
		list("NT"   "int" 1)  
		list("TOP_ME" "string" "9")
		list("BTM_ME" "string" "8")
		list("en_dmy" "boolean" t)
		list("vias" "boolean" t)
		list("top" "boolean" t))
	)
	
	/**** PORT 1 / PORT 2 ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil (-S-OD/2:0) "MY" 1
		list(
		list("W" 	"float" WI)	 
		list("OPENING" 	"float" LOP)	 
		list("LEAD" 	"float" LEAD)
		list("TOP_ME" "string" "9")
		list("LEAD_ME" "string" "9")	
		list("dummy" "boolean" en_dmy)
		list("P1TXT" "string" "P1")
		list("N1TXT" "string" "N1")
	))
	
	/**** PORT 3 / PORT 4 ****/ 
	dbCreateParamInst(pcCellView m_lead_pair nil OD/2:0 "R0" 1
		list(
		list("W" 	"float" WO)	 
		list("OPENING" 	"float" ROP)	 
		list("LEAD" 	"float" LEAD)
		list("TOP_ME" "string" "9")
		list("LEAD_ME" "string" "9")	
		list("dummy" "boolean" en_dmy)
		list("P1TXT" "string" "P2")
		list("N1TXT" "string" "N2")
	))
	
	dbCreateParamInst(pcCellView m_base_em_gr nil (-S/2):0.0 "R0" 1
    list(
        list("W" "float" (2*LEAD+OD+S))
        list("L" "float" (OD+30.0))
        list("LW" "float" 2.0)
        list("boundary_ext" "float" 10.0)
        list("priority" "int" 1)
    ))

	rfvlsiEMVport("port1",(-LEAD-S-OD/2),LOP, (-LEAD-S-OD/2),LOP+WI,0,8,1);
	rfvlsiEMVport("port2",(-LEAD-S-OD/2),-LOP,(-LEAD-S-OD/2),-LOP-WI,0,8,1);
	rfvlsiEMVport("port3",(OD/2+LEAD), ROP,(OD/2+LEAD),ROP+WO,0,8,1);
	rfvlsiEMVport("port4",(OD/2+LEAD),-ROP,(OD/2+LEAD),-ROP-WO,0,8,1);
	
)/*end of let*/
)/*end of pcDefinePCell*/
