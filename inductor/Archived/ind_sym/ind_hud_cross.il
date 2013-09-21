/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
strLibName="RFVLSI_N65";	
strCellName="ind_hud_cross";
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 180.0)
	(W 	"float" 2.0)
	(S 	"float" 2.0)
	(OPENING "float" 10.0)
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
	(under "boolean" t)
	(dummy "boolean" t)
	(DUMMYL "string" "RFVLSI")
)

let((P via_to_next C C2 pi OO OOC OOCH),
	P=W+S
	if(atoi(TOP_ME) - atoi(BTM_ME) <2
	then
		via_to_next = nil
	)
	pi = 3.141592
	C = ceiltogrid(W*tan(pi/8) + 0.005)
	C2 = roundtogrid(C/sqrt(2))
	OO = 2*W+S
	OOC = 2*W+S-2*C2
	OOCH = OOC/2
	
	if(S <=2.0*sqrt(2)
	then
		dbCreateParamInst(pcCellView 
			dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
			nil -OD/2:0 "R0" 1
			list(
			list("OD" "float" OD) 
			list("W" "float" W) 
			list("S" "float" S) 
			list("LOP" "float" OOCH + roundtogrid(2*sqrt(2.0)- S)+0.01)
			list("ROP" "float" OPENING) 
			list("TOP_ME" "string" TOP_ME) 
			list("BTM_ME" "string" BTM_ME) 
			list("DUMMYL" "string" "RFVLSI") 
			list("dummy" "boolean" dummy) 
			list("via_to_next" "boolean"	via_to_next)
			list("via_diag" "boolean"	via_to_next)
		)) ; close dbCreateParamInst
 else
 	dbCreateParamInst(pcCellView 
			dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
				nil -OD/2:0 "R0" 1
				list(
				list("OD" "float" OD) 
				list("W" "float" W) 
				list("S" "float" S) 
				list("LOP" "float" OOCH)
				list("ROP" "float" OPENING) 
				list("TOP_ME" "string" TOP_ME) 
				list("BTM_ME" "string" BTM_ME) 
				list("DUMMYL" "string" "RFVLSI") 
				list("dummy" "boolean" dummy) 
				list("via_to_next" "boolean"	via_to_next)
				list("via_diag" "boolean"	via_to_next)
		)) ; close dbCreateParamInst
 )
	if(under
	then
		dbCreateParamInst(pcCellView
			dbOpenCellViewByType(pcCellView~>lib "xfm_cross" "layout") nil -OD/2:0 "R0" 1
			list(
				list("WI" "float" S) 				
				list("WO" "float" W) 				
				list("S" "float" 0.0) 
				list("TOP_ME" "int" atoi(TOP_ME)) 
				list("BTM_ME" "int" atoi(TOP_ME)-1) 
				list("dummy" "boolean" dummy) 
				)) ; close dbCreateParamInst
		dbCreateParamInst(pcCellView
			dbOpenCellViewByType(pcCellView~>lib "xfm_cross" "layout") nil -OD/2+P+W:0 "MY" 1
			list(
				list("WI" "float" S) 				
				list("WO" "float" W) 				
				list("S" "float" 0.0) 
				list("TOP_ME" "int" atoi(TOP_ME)) 
				list("BTM_ME" "int" atoi(TOP_ME)) 
				list("viat" "boolean" nil) 
				list("viad" "boolean" nil) 				
				list("dummy" "boolean" dummy) 
				)) ; close dbCreateParamInst
		)
))
