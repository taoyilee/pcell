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

strCellName="ind_dual";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD "float" 50.0) 
	(W "float" 2.0) 
	(SS_Gap1 "float" 3.0) 
	(SG_Gap1 "float" 3.0) 
	(SS_Gap2 "float" 3.0) 
	(SG_Gap2 "float" 3.0) 
	(LEAD "float" 10.0) 
	(S "float" 2.0) 
	(NT "int" 2)
	(strName "string" "ind_dual")
	(NT_N "boolean" nil)
	(short1 "boolean" nil)
	(gnd1 "boolean" nil)
	(sig1 "boolean" nil)
	(sig2 "boolean" nil)
	(short2 "boolean" nil)
	(gnd2 "boolean" nil)
	(GND_ME "int" 3)
)
let((P DUMMYL m_ind_sym m_vias m_lead m_base_em_bc m_mesh_rect lead_length xx1) ,
	P=W+S /* Line pitch: width + space */ 
	DUMMYL = "RFVLSI"
	lead_length = 2*MinMetSpacing(8) + W 
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy5"), 0:1.2, sprintf(nil "%L" W), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy6"), 0:0, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), 0:-1.2, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "dummy8"), 0:-2.4, sprintf(nil "%L" NT), "centerCenter", "R0", "roman", 1)
	dbCreateLabel(pcCellView, list(DUMMYL, "drawing"), 0:-3.6, strName, "centerCenter", "R0", "roman", 1)
	m_ind_sym = dbOpenCellViewByType(pcCellView~>lib "ind_sym" "layout" )
	m_base_em_bc = dbOpenCellViewByType(pcCellView~>lib "base_em_bc" "layout" )
	m_vias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout" )
	m_lead = dbOpenCellViewByType(pcCellView~>lib "base_lead" "layout" )
	m_mesh_rect = dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout" )

    dbCreateParamInst(pcCellView m_ind_sym nil (-OD/2-lead_length-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2-W):0 "R0" 1 list(
		list("OD"     "float" OD)
        list("W"      "float" W)
        list("OPENING"    "float" 4.0)
        list("LEAD"   "float" lead_length)
        list("S"      "float" S)
        list("NT" "int" NT)
        list("NT_N"     "boolean" NT_N)
        list("dummy"     "boolean" nil)
		)
	)
    dbCreateParamInst(pcCellView m_ind_sym nil (OD/2+lead_length+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2+W):0 "MY" 1 list(
		list("OD"     "float" OD)
        list("W"      "float" W)
        list("OPENING"    "float" 4.0)
        list("LEAD"   "float" lead_length)
        list("S"      "float" S)
        list("NT" "int" NT)
        list("NT_N"     "boolean" NT_N)
        list("dummy"     "boolean" nil)
	))
	if(gnd1
	then
		dbCreateRect(pcCellView MetalVec(8) 
			list((-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2):-4.0 
				(-2*W-SG_Gap1-SS_Gap1/2):(-4.0-W)))
		dbCreateRect(pcCellView MetalVec(8) 
			list((W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2):-4.0 
				(2*W+SS_Gap1/2+SG_Gap1):(-4.0-W)))
		dbCreateParamInst(pcCellView m_vias nil (-W-SS_Gap1/2-SG_Gap1):-4.0 "R180" 1
		    list(
        		list("Width" "float" W)
		        list("Length" "float" (W+2*MinMetSpacing(8)))
		        list("TOP_ME" "int" 9)
		        list("BTM_ME" "int" GND_ME)
		    )) /* lower left */
	    dbCreateParamInst(pcCellView m_vias nil (W+SS_Gap1/2+SG_Gap1):-4.0 "MX" 1
		    list(
		        list("Width" "float" W)
		        list("Length" "float" (W+2*MinMetSpacing(8)))
		        list("TOP_ME" "int" 9)
		        list("BTM_ME" "int" GND_ME)
		    )) /* lower right */
	)
	if(sig1
    then
        dbCreateRect(pcCellView MetalVec(8)
            list((-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2):-4.0
                (-SS_Gap1/2):(-4.0-W)))
        dbCreateRect(pcCellView MetalVec(8)
            list((W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2):-4.0
                (SS_Gap1/2):(-4.0-W)))
    )

	if(short1
	then
		dbCreateRect(pcCellView MetalVec(8) 
			list((-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2):-4.0 
				(W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2):(-4.0-W)))
	)
	/* top */
	dbCreateParamInst(pcCellView m_mesh_rect nil (-W-SG_Gap1-SS_Gap1/2):(-OD/2-LEAD) "R0" 1
    list(
        list("Width" "float" (2*W+SS_Gap1+2*SG_Gap1))
        list("Length" "float" (OD/2+LEAD-4.0-2*MinMetSpacing(8)-W))
        list("TOP_ME" "int" GND_ME)
        list("BTM_ME" "int" GND_ME)
		list("len_Void"   "float" 1.0)
        list("len_Fill"   "float" 1.0)
    ))
	if(short2
	then
		dbCreateRect(pcCellView MetalVec(8) 
			list((-W-2*max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2):4.0 
				(W+2*max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2):(4.0+W)))
	)
	if(sig2
    then
        dbCreateRect(pcCellView MetalVec(8)
            list((-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2):4.0
                (-SS_Gap2/2):(4.0+W)))
        dbCreateRect(pcCellView MetalVec(8)
            list((W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2):4.0
                (SS_Gap2/2):(4.0+W)))
    )

	if(gnd2
	then
		dbCreateRect(pcCellView MetalVec(8) 
			list((-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2):4.0 
				(-2*W-SG_Gap2-SS_Gap2/2):(4.0+W)))
		dbCreateRect(pcCellView MetalVec(8) 
			list((W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2):4.0 
				(2*W+SS_Gap2/2+SG_Gap2):(4.0+W)))
		dbCreateParamInst(pcCellView m_vias nil (-W-SS_Gap2/2-SG_Gap2):4.0 "MY" 1
            list(
                list("Width" "float" W)
                list("Length" "float" (W+2*MinMetSpacing(8)))
                list("TOP_ME" "int" 9)
                list("BTM_ME" "int" GND_ME)
            )) /* lower left */
        dbCreateParamInst(pcCellView m_vias nil (W+SS_Gap2/2+SG_Gap2):4.0 "R0" 1
            list(
                list("Width" "float" W)
                list("Length" "float" (W+2*MinMetSpacing(8)))
                list("TOP_ME" "int" 9)
                list("BTM_ME" "int" GND_ME)
            )) /* lower right */
	)
	dbCreateParamInst(pcCellView m_mesh_rect nil (-W-SG_Gap2-SS_Gap2/2):(OD/2+LEAD) "MX" 1
    list(
        list("Width" "float" (2*W+SS_Gap2+2*SG_Gap2))
        list("Length" "float" (OD/2+LEAD-4.0-2*MinMetSpacing(8)-W))
        list("TOP_ME" "int" GND_ME)
        list("BTM_ME" "int" GND_ME)
        list("len_Void"   "float" 1.0)
        list("len_Fill"   "float" 1.0)
    ))
	/* mesh_rect in the middle */
	dbCreateParamInst(pcCellView m_mesh_rect nil (-2*W-max(SG_Gap1 SG_Gap2)-max(SS_Gap2 SS_Gap1)/2):(-4.0-2*MinMetSpacing(8)-W) "R0" 1
    list(
        list("Width" "float" (4*W+max(SS_Gap1 SS_Gap2)+2*max(SG_Gap1 SG_Gap2)))
        list("Length" "float" (8.0+4*MinMetSpacing(8)+2*W))
        list("TOP_ME" "int" GND_ME)
        list("BTM_ME" "int" GND_ME)
        list("len_Void"   "float" 2.0)
        list("len_Fill"   "float" 1.0)
    ))

	dbCreateParamInst(pcCellView m_vias nil (-W-SS_Gap1/2-SG_Gap1):(-OD/2-LEAD) "MY" 1
    list(
        list("Width" "float" W)
        list("Length" "float" (OD/2+LEAD-4.0-W-2*MinMetSpacing(8)))
        list("TOP_ME" "int" 9)
        list("BTM_ME" "int" GND_ME)
    )) /* lower left */

	dbCreateParamInst(pcCellView m_vias nil (W+SS_Gap1/2+SG_Gap1):(-OD/2-LEAD) "R0" 1
    list(
        list("Width" "float" W)
        list("Length" "float" (OD/2+LEAD-4.0-W-2*MinMetSpacing(8)))
        list("TOP_ME" "int" 9)
        list("BTM_ME" "int" GND_ME)
    )) /* lower right */
	dbCreateParamInst(pcCellView m_vias nil (-W-SS_Gap2/2-SG_Gap2):(OD/2+LEAD) "R180" 1
    list(
        list("Width" "float" W)
        list("Length" "float" (OD/2+LEAD-4.0-W-2*MinMetSpacing(8)))
        list("TOP_ME" "int" 9)
        list("BTM_ME" "int" GND_ME)
    )) /* upper left */

    dbCreateParamInst(pcCellView m_vias nil (W+SS_Gap2/2+SG_Gap2):(OD/2+LEAD) "MX" 1
    list(
        list("Width" "float" W)
        list("Length" "float" (OD/2+LEAD-4.0-W-2*MinMetSpacing(8)))
        list("TOP_ME" "int" 9)
        list("BTM_ME" "int" GND_ME)
    )) /* upper right */


	xx1 = max(SS_Gap1 SS_Gap2)/2+max(SG_Gap1 SG_Gap2)+2*W+2*MinMetSpacing(8)
	dbCreateRect(pcCellView list("RFVLSI" "drawing") 
		list(-xx1:-4.0-W xx1:4.0+W))
	;dbCreateRect(pcCellView list("RFVLSI_LVS" "dummy9") list(-xx1:-4.0-W xx1:4.0+W))

	dbCreateParamInst(pcCellView m_base_em_bc nil 0:0 "R0" 1
	list(
		list("W" "float" (2*OD+2*LEAD+2*MinMetSpacing(8)+2*max(SS_Gap1 SS_Gap2)))
	    list("L" "float" (OD+2*LEAD-4))
	    list("LW" "float" 2.0)
    	list("boundary_ext" "float" 10.0)
	    list("priority" "int" 3)
	))
	rfvlsiEMVport("N1", (-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2), 4.0, (-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2), (4.0+W),2,8,2);
	rfvlsiEMVport("P1", (-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2), (-4.0), (-W-max(SG_Gap1 SG_Gap2)-max(SS_Gap1 SS_Gap2)/2), (-4.0-W),2,8,2);
	rfvlsiEMVport("N2", (W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2), 4.0, (W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2), (4.0+W),2,8,2);
	rfvlsiEMVport("P2", (W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2), (-4.0), (W+max(SG_Gap1 SG_Gap2)+max(SS_Gap1 SS_Gap2)/2), (-4.0-W),2,8,2);
)) /* end of */
