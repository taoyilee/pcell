strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="ind_diff_tseng";	The Cell Name is called inductor
strViewName="layout";	This is a virtuoso layout
; Define my parameterized cell with the information above
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD	"float"	110.0)	; Inductor total width
	(W	"float"	3.0)	; Line width
	(OPEN "float" 5.0)
	(DIV 	"float"	3.5) ; Turns
	(LEAD	"float"	20.0) ; Turns 
)
let((pcCellView maskGrid METOP_LAYER INDDMY_LAYER NT P pi S HOD C A B BA BB),
pcCellView=pcCellView;  
maskGrid = 0.005
METOP_LAYER=list("M9","drawing")
INDDMY_LAYER=list("RFVLSI_LVS","drawing")

NT=1;

/**** IND tlc****/
S=0;
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

; A cycle
; component 1

pg1=dbCreatePolygon(pcCellView, METOP_LAYER,list(
W:-BB           A:-BB-A+W
OD+P-A:-BB-A+W OD+S:-BB
OD+S:0-OPEN        OD+P:0-OPEN
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:0-OPEN W:0-OPEN	))

pg2d=dbCreatePolygon(pcCellView, METOP_LAYER,list(
W:BB           A:BB+A-W
OD+P-A:BB+A-W OD+S:BB
OD+S:OPEN        OD+P:OPEN
OD+P:BB+C     OD+P-A+C:BB+A
A-C:BB+A      0:BB+C
0:OPEN W:OPEN	))

pg1=dbCreatePolygon(pcCellView, INDDMY_LAYER,list(
0:OPEN
0:BB+C A-C:BB+A  
OD+P-A+C:BB+A OD+P:BB+C 
OD+P:OPEN OD+P:0-OPEN
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:0-OPEN ))

pg1=dbCreatePolygon(pcCellView, list("NT_N", "drawing"),list(
0:OPEN
0:BB+C A-C:BB+A  
OD+P-A+C:BB+A OD+P:BB+C 
OD+P:OPEN OD+P:0-OPEN
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:0-OPEN ))
/* -- Dummy Insertion Exclusion ----- */
pg1=dbCreatePolygon(pcCellView, list("DMEXCL", "dummy9"),list(
0:OPEN
0:BB+C A-C:BB+A  
OD+P-A+C:BB+A OD+P:BB+C 
OD+P:OPEN OD+P:0-OPEN
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:0-OPEN ))
pg1=dbCreatePolygon(pcCellView, list("DMEXCL", "dummy8"),list(
0:OPEN
0:BB+C A-C:BB+A  
OD+P-A+C:BB+A OD+P:BB+C 
OD+P:OPEN OD+P:0-OPEN
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:0-OPEN ))
pg1=dbCreatePolygon(pcCellView, list("VIAEXCL", "dummy8"),list(
0:OPEN
0:BB+C A-C:BB+A  
OD+P-A+C:BB+A OD+P:BB+C 
OD+P:OPEN OD+P:0-OPEN
OD+P:-BB-C     OD+P-A+C:-BB-A
A-C:-BB-A      0:-BB-C
0:0-OPEN ))
/* ----- Inserting LVS Info ------- */

dbCreateLabel(pcCellView, list("RFVLSI_LVS","drawing"), OD/2:0.0, "ind_diff_tseng", "centerCenter", "R0", "roman", 3.0)

dbCreateRect(pcCellView, list("RFVLSI_LVS","lvs_pin1"),list(0:OPEN W:OPEN+W))
dbCreateLabel(pcCellView, list("RFVLSI_LVS","lvs_pin1"), W/2:OPEN+0.5, "p1", "centerCenter", "R0", "roman", 0.5)
dbCreateRect(pcCellView, list("RFVLSI_LVS","lvs_pin2"),list(0:-OPEN W:-OPEN-W))
dbCreateLabel(pcCellView, list("RFVLSI_LVS","lvs_pin2"), W/2:-OPEN-0.5, "p2", "centerCenter", "R0", "roman", 0.5)
dbCreateRect(pcCellView, list("RFVLSI_LVS","lvs_pin3"),list(OD+S:OPEN OD+P:OPEN+W))
dbCreateLabel(pcCellView, list("RFVLSI_LVS","lvs_pin3"), OD+S+W/2:OPEN+0.5, "p3", "centerCenter", "R0", "roman", 0.5)
dbCreateRect(pcCellView, list("RFVLSI_LVS","lvs_pin4"),list(OD+S:-OPEN OD+P:-OPEN-W))
dbCreateLabel(pcCellView, list("RFVLSI_LVS","lvs_pin4"), OD+S+W/2:-OPEN-0.5, "p4", "centerCenter", "R0", "roman", 0.5)
/****END IND tlc****/
)/*end of let*/
)/*end of pcDefinePCell*/

