
strLibName="RFVLSI_N65";  /*Assign your library name to variable strLibName*/
strCellName="ind_oct_t";	  /*Assign your cell name to variable strCellName*/
strViewName="layout";     /*Assign your view name to variable strViewName*/

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD	"float"	80.0)  ; Inductor total width
	(W 	"float" 8.0)	; Line width
	(S	"float"	1.0) ; Line spacing
	(GAP "float" 3.0)
	(DIV "float"	3.0) ; Line spacing
	(dmy_en "boolean" nil)
)
let((pcCellView METOP techfile_Lib DMY_LAYER NTN_LAYER maskGrid pi HOD P C A B BA BB),
pcCellView=pcCellView;  
ME_LAYER= list("M9","drawing")
NTN_LAYER= list("NT_N","drawing")

techfile_lib="tsmcN65"
DMY_LAYER=list("RFVLSI_LVS" "drawing")
maskGrid=0.005
	
pi=3.14159
HOD=OD/2
P=S+W

C=W*tan(pi/8)/maskGrid
C=maskGrid*pcRound(C,0.001,3)

A=OD/DIV/maskGrid
A=maskGrid*pcRound(A,0.001,3)

B=OD-2*A

BA=B/2/maskGrid
BA=maskGrid*pcRound(BA,0.001,3)
BB=B-BA

if(dmy_en
then
	pg1d=dbCreatePolygon(pcCellView, DMY_LAYER,list(
	OD:(GAP/2)            OD-W:(GAP/2)
	OD-W:BA         OD-A:BA+A-W
	A:BA+A-W        W:BA
	W:-BB           A:-BB-A+W
	OD+P-A:-BB-A+W OD+S:-BB
	OD+S:(-GAP/2)        OD+P:(-GAP/2)
	OD+P:-BB-C     OD+P-A+C:-BB-A
	A-C:-BB-A      0:-BB-C
	0:BA+C          A-C:BA+A
	OD-A+C:BA+A     OD:BA+C))
)

pg1=dbCreatePolygon(pcCellView, ME_LAYER,list(
OD:(GAP/2)            OD-W:(GAP/2)
OD-W:BA         OD-A:BA+A-W
A:BA+A-W        W:BA
W:-BB           A:-BB-A+W
OD+P-A:-BB-A+W OD+S:-BB
OD+S:(-GAP/2)        OD+P:(-GAP/2)
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:BA+C          A-C:BA+A
OD-A+C:BA+A     OD:BA+C))

pg_ntn=dbCreatePolygon(pcCellView, NTN_LAYER,list(
OD:(-GAP/2)        OD+P:(-GAP/2)
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:BA+C          A-C:BA+A
OD-A+C:BA+A     OD:BA+C))

pg_ntn=dbCreatePolygon(pcCellView, list("DMEXCL", "dummy9"),list(
OD:(-GAP/2)        OD+P:(-GAP/2)
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:BA+C          A-C:BA+A
OD-A+C:BA+A     OD:BA+C))

pg_ntn=dbCreatePolygon(pcCellView, list("DMEXCL", "dummy8"),list(
OD:(-GAP/2)        OD+P:(-GAP/2)
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:BA+C          A-C:BA+A
OD-A+C:BA+A     OD:BA+C))
pg_ntn=dbCreatePolygon(pcCellView, list("VIAEXCL", "dummy8"),list(
OD:(-GAP/2)        OD+P:(-GAP/2)
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:BA+C          A-C:BA+A
OD-A+C:BA+A     OD:BA+C))

)/*end of let*/
)/*end of pcDefinePCell*/

