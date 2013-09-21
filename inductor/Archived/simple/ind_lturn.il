/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */


strLibName="RFVLSI_N65"
strCellName="ind_lturn"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD	"float"	80.0)  ; Inductor total width
	(W 	"float"	8.0)	; Line width
	(S	"float"	1.0) ; Line spacing
	(DIV	"float"	3.0) ; Line spacing
	(OPEN	"float"	2.5) ; Line spacing
	(TOP_ME "string" "9")
	(BTM_ME "string" "9")
    (VIA "string" 	"VIA8")
	(INDDMY       "string" "RFVLSI")
	(INDDMYP      "string" "drawing")
	(dummy      "boolean" t)
	(via_to_next      "boolean" nil)
	(via_diag	  "boolean" nil)
)
let((HOD pi P C A B BA BB),
	fprintf(stderr "PCELL BY TAO YI LEE (michael@michaelgod.idv.tw)\nRFVLSILAB, NCTU\n")
	pi=3.14159
	HOD=OD/2
	P=S+W
	C=roundtogrid(W*tan(pi/8))
	A= roundtogrid(OD/DIV)
	B=OD-2*A
	BA=roundtogrid(B/2)
	BB=B-BA
		TOP_ME = atoi(TOP_ME)
		BTM_ME = atoi(BTM_ME)

; A cycle
; component 1
if(dummy
then
	pg1d = dbCreatePolygon(pcCellView list(INDDMY, INDDMYP)
	list(
	OD:S            OD-W:S
	OD-W:BA         OD-A:BA+A-W
	A:BA+A-W        W:BA
	W:-BB           A:-BB-A+W
	OD+P-A:-BB-A+W OD+S:-BB
	OD+S:0        OD+P:0
	OD+P:-BB-C     OD+P-A+C:-BB-A
	A-C:-BB-A      0:-BB-C
	0:BA+C          A-C:BA+A
	OD-A+C:BA+A     OD:BA+C))
)

for(i BTM_ME TOP_ME
	polygon = rodCreatePolygon(
		?name sprintf(nil "polygon%d" i)
		?layer MetalVec(i-1)
		?cvId pcCellView
		?pts list(
		OD:S            OD-W:S
		OD-W:BA         OD-A:BA+A-W
		A:BA+A-W        W:BA
		W:-BB           A:-BB-A+W
		OD+P-A:-BB-A+W OD+S:-BB
		OD+S:0        OD+P:0
		OD+P:-BB-C     OD+P-A+C:-BB-A
		A-C:-BB-A      0:-BB-C
		0:BA+C          A-C:BA+A
		OD-A+C:BA+A     OD:BA+C)
	)

)


if(BTM_ME!=TOP_ME
then
        masterv = dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
        mastervd = dbOpenCellViewByType(pcCellView~>lib "vias_diagonal" "layout")
        dbCreateParamInst(
        pcCellView masterv nil OD-W:S "R0" 1
        list(
                list("Length"  "float" BA-S)
                list("Width"    "float" W)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst

        dbCreateParamInst(
        pcCellView masterv nil OD-W+P:-BB "R0" 1
        list(
                list("Length"  "float" BB-W)
                list("Width"    "float" W)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst
        dbCreateParamInst(
        pcCellView masterv nil 0:-BB "R0" 1
        list(
                list("Length"  "float" B)
                list("Width"    "float" W)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst
        dbCreateParamInst(
        pcCellView masterv nil A:BA+A-W "R0" 1
        list(
                list("Length"  "float" W)
                list("Width"    "float" B)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst
        dbCreateParamInst(
        pcCellView masterv nil A:-BA-A "R0" 1
        list(
                list("Length"  "float" W)
                list("Width"    "float" B+P)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst
        ; diagonal vias
	dbCreateParamInst(
        pcCellView mastervd nil 0:BA+C "R0" 1
        list(
                list("Length"  "float" A-C-W)
                list("Width"    "float" W+C)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst
        dbCreateParamInst(
        pcCellView mastervd nil 0:-BB-C "MX" 1
        list(
                list("Length"  "float" A-C-W)
                list("Width"    "float" W+C)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst

        dbCreateParamInst(
        pcCellView mastervd nil OD:BA+C "MY" 1
        list(
                list("Length"  "float" A-C-W)
                list("Width"    "float" W+C)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst
        dbCreateParamInst(
        pcCellView mastervd nil OD+P:-BB-C "R180" 1
        list(
                list("Length"  "float" A-C-W)
                list("Width"    "float" W+C)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst
)

)/*end of let*/
)/*end of pcDefinePCell*/

