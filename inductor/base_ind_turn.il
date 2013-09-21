/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee
*/

strCellName="base_ind_turn"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD	"float"	80.0)  ; Inductor total width
	(OPENU "float" 0.0)  ; Inductor total width
	(OPEND "float" 0.0)  ; Inductor total width
	(W 	"float" 8.0)	; Line width
	(S	"float"	1.0) ; Line spacing
	(DIV	"float"	3.0) ; Line spacing
	(TOP_ME "string" "9")
	(BTM_ME "string" "8")
	(INDDMY       "string" "RFVLSI")
	(INDDMYP      "string" "drawing")
	(dummy		"boolean" t)
	(NT_N		"boolean" t)
	(DMEXCL		"boolean" t)
)

let((pi HOD P C A B BA BB pgpt),
	techfile_lib = techGetTechLibName(pcCellView~>lib)
	techFileID = techGetTechFile(ddGetObj(techfile_lib))
	maskGrid = techGetParam(techFileID "maskGrid")
	pi=3.14159
	HOD=OD/2
	P=S+W
	C=maskGrid*pcRound(W*tan(pi/8)/maskGrid)
	A=maskGrid*pcRound(OD/DIV/maskGrid)
	B=OD-2*A
	BA=maskGrid*pcRound(B/2/maskGrid)
	BB=B-BA

pgpt = list(
        OD:0            OD-W:0
        OD+S:0        OD+P:0
        OD+P:-BB-C     OD+P-A+C:-BB-A
        A-C:-BB-A      0:-BB-C
        0:BA+C          A-C:BA+A
        OD-A+C:BA+A     OD:BA+C)

if(NT_N
then
	dbCreatePolygon(pcCellView  list("NT_N", "drawing") pgpt)
)

if(dummy
then
	pg1d=dbCreatePolygon(pcCellView, list(INDDMY, INDDMYP) pgpt)
	for(m (atoi(BTM_ME)-1) (atoi(TOP_ME)-1)
		dbCreatePolygon(pcCellView, RFVLSI_LVS_Vec(m) pgpt)
	)
)

if(DMEXCL
then
	dbCreatePolygon(pcCellView, list("DMEXCL", "dummy6") pgpt)
	dbCreatePolygon(pcCellView, list("DMEXCL", "dummy7") pgpt)
	dbCreatePolygon(pcCellView, list("DMEXCL", "dummy8") pgpt)
	dbCreatePolygon(pcCellView, list("DMEXCL", "dummy9") pgpt)
	dbCreatePolygon(pcCellView, list("VIAEXCL", "dummy8") pgpt)
)

		TOP_ME = atoi(TOP_ME)
		BTM_ME = atoi(BTM_ME)
for(i BTM_ME TOP_ME
	pg1=dbCreatePolygon(pcCellView, MetalVec(i-1),list(
	OD:OPENU            OD-W:OPENU
	OD-W:BA         OD-A:BA+A-W
	A:BA+A-W        W:BA
	W:-BB           A:-BB-A+W
	OD+P-A:-BB-A+W OD+S:-BB
	OD+S:-OPEND        OD+P:-OPEND
	OD+P:-BB-C     OD+P-A+C:-BB-A
	A-C:-BB-A      0:-BB-C
	0:BA+C          A-C:BA+A
	OD-A+C:BA+A     OD:BA+C)
	)
)
	masterv = dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	mastervd = dbOpenCellViewByType(pcCellView~>lib "vias_diagonal" "layout")

 if(TOP_ME!=BTM_ME
then
        dbCreateParamInst(
        pcCellView masterv nil OD-W:2*P "R0" 1
        list(
                list("Length"  "float" BA-2*P)
                list("Width"    "float" W)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME))) ; close dbCreateParamInst

        dbCreateParamInst(
        pcCellView masterv nil OD+P-W:-BB "R0" 1
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

