/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strLibName="RFVLSI_N65"; 
strCellName="xfm_lct_t";	


/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)  ; Inductor total width
	(W	"float" 4.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(CW	"float"	20.0) ; Line spacing
	(B_TK	"float"	0.0) ; Line spacing
	(A_TK	"float"	0.0) ; Line spacing
	(DIV	"float"	3.414214) ; Line spacing
	(OPENING "float"	10.0) ; Line spacing
	(POP "float"	10.0) ; Line spacing
	(dummy "boolean"	t) ; Line spacing
	(TOP_ME "int"	9) ; Line spacing
	(BTM_ME "int"	9) ; Line spacing
	(text "string"	"xfm") ; Line spacing

)
let((pi P C A),
		pi=3.141592
		P=S+W
	C=roundgrid(W*tan(pi/8))
	A=roundtogrid(OD/DIV)
	A=A-A_TK
	B=OD-2*A
	B=B-B_TK
	BA=roundtogrid(B/2)
	BA=maskGrid*pcRound(BA precision toler)
BB=B-BA

PA=P/2/maskGrid
PA=maskGrid*pcRound(PA precision toler)
PB=P-PA

; A cycle
; component 1
master = dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
inst=dbCreateParamInst(
        pcCellView master nil 0:0 "R0" 1
        list(
      		list("OD"     "float" OD)  ; Inductor total width
        	list("W"      "float" W)    ; Line width
        	list("S"      "float" S) ; Line spacing
        	list("B_TK"   "float" B_TK) ; Line spacing
        	list("A_TK"   "float" A_TK) ; Line spacing
        	list("DIV"    "float" DIV) ; Line spacing
        	list("OPENING" "float" OPENING+2*P) ; Line spacing
        	list("POP" "float"    POP) ; Line spacing
        	list("TOP_ME" "int"    TOP_ME) ; Line spacing
        	list("BTM_ME" "int"    BTM_ME) ; Line spacing
	        list("DUMMYL" "string"  "RFVLSI") ; Line spacing
        	list("dummy" "boolean"   dummy) ; Line spacing
        )) ; close dbCreateParamInst

dbCreatePolygon(pcCellView, list("NT_N","drawing"),list(OD:BA+C	OD-A+C:BA+A A-C:BA+A 0:BA+C 0:-BB-C A-C:-BB-A OD-A+C:-BB-A OD-A+C:-BB-A OD:-BB-C))
dbCreatePolygon(pcCellView, list("DMEXCL", "dummy9"),list(OD:BA+C	OD-A+C:BA+A A-C:BA+A 0:BA+C 0:-BB-C A-C:-BB-A OD-A+C:-BB-A OD-A+C:-BB-A OD:-BB-C))
dbCreatePolygon(pcCellView, list("DMEXCL", "dummy8"),list(OD:BA+C	OD-A+C:BA+A A-C:BA+A 0:BA+C 0:-BB-C A-C:-BB-A OD-A+C:-BB-A OD-A+C:-BB-A OD:-BB-C))
dbCreatePolygon(pcCellView, list("VIAEXCL", "dummy8"),list(OD:BA+C	OD-A+C:BA+A A-C:BA+A 0:BA+C 0:-BB-C A-C:-BB-A OD-A+C:-BB-A OD-A+C:-BB-A OD:-BB-C))
if(dummy
then
;	dbCreatePolygon(pcCellView, list("RFVLSI","drawing"),list(OD:BA+C	OD-A+C:BA+A A-C:BA+A 0:BA+C 0:-BB-C A-C:-BB-A OD-A+C:-BB-A OD-A+C:-BB-A OD:-BB-C))
	dbCreateLabel(pcCellView, list("RFVLSI","drawing"), 0:0, text, "centerCenter", "R0", "roman", OD/10)
)
if(BTM_ME == TOP_ME
then
	BTM_ME = TOP_ME-1
	masterVIAS= dbOpenCellViewByType("RFVLSI_N65" "vias" "layout")
                dbCreateParamInst(
                pcCellView masterVIAS nil 0:-OPENING/2-P-W "R0" 1
                        list(
                        list("Length" "float"    W)
                        list("Width" "float"   W)
                        list("TOP_ME" "float" TOP_ME)
                        list("BTM_ME" "float" BTM_ME)
                ) ; close list
                ) ; close dbCreateParamInst

		dbCreateParamInst(
                pcCellView masterVIAS nil 0:OPENING/2+P "R0" 1
                        list(
                        list("Length" "float"    W)
                        list("Width" "float"   W)
                        list("TOP_ME" "float" TOP_ME)
                        list("BTM_ME" "float" BTM_ME)
                ) ; close list
                ) ; close dbCreateParamInst
)

cross = dbOpenCellViewByType(pcCellView~>lib "xfm_cross" "layout")
crossa=dbCreateParamInst(
        pcCellView cross nil 0:0 "MX" 1
        list(
			list("W" 	"float" W)	; Line width
			list("S"	"float"	CW) ; Line spacing
			list("TOP_ME"	"int"	TOP_ME) ; Line spacing
			list("BTM_ME"	"int"	BTM_ME) ; Line spacing
			list("OPENING" "float"	OPENING-2*S) ; Line spacing
			list("dummy" "boolean"	dummy) ; Line spacing
			list("viat" "boolean"	t) ; Line spacing
			list("viad" "boolean"	t) ; Line spacing
			list("top" "boolean"	t) ; Line spacing
        ) ; close list
        ) ; close 
; Cross B MDOWN
crossb=dbCreateParamInst(
        pcCellView cross nil 0:0 "R0" 1
        list(
			list("W" "float" W)
			list("S" "float" CW)
			list("TOP_ME" "int" TOP_ME)
			list("BTM_ME"	"int"	BTM_ME) ; Line spacing
			list("OPENING" "float" OPENING-2*S)
			list("dummy" "boolean"	dummy) ; Line spacing
			list("viat" "boolean"	nil) ; Line spacing
			list("viad" "boolean"	t) ; Line spacing
			list("top" "boolean"	nil) ; Line spacing
        ) ; close list
        ) ; close dbCreateParamInst
	dbCreateRect(pcCellView, MetalVec(BTM_ME-1),list(0:-OPENING/2-P  W:-OPENING/2+S))
	dbCreateRect(pcCellView, MetalVec(BTM_ME-1),list(0:OPENING/2-S  W:OPENING/2+P))
)/*end of let*/
)/*end of pcDefinePCell*/
