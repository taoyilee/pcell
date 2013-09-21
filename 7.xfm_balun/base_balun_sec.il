/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_balun_sec"

/*Open our layout cell, and pass our layout cell identifier to variable pcCellView */
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 100.0)  ; Inductor total width
	(WI	"float" 4.0)	
	(WO	"float" 4.0)	
	(S	"float"	2.0) 
	(CW	"float"	20.0) 
	(B_TK	"float"	0.0) 
	(LEADDYI 	"float" 0.0)	
	(LEADDYO 	"float" 0.0)	
	(A_TK	"float"	0.0) 
	(DIV	"float"	3.414) 
	(LOP "float"	10.0) 
	(dummy "boolean"	t) 
	(DUMMYL "string" "RFVLSI") 
)
let((P pi C A B BA BB master inst polyg),
        ;fprintf(stderr "Transformer (I) by  TAO YI LEE (michael@michaelgod.idv.tw)\nRFVLSILAB, NCTU\n")
	pi=3.141592
	P=S+WI
	C=roundtogrid(WI*tan(pi/8))
	A=roundtogrid(OD/DIV) - A_TK
	B=OD-2*A-B_TK
	BA = roundtogrid(B/2)
	BB = B - BA

	master = dbOpenCellViewByType(pcCellView~>lib "base_oct" "layout" );
	dbCreateParamInst(pcCellView master nil 0:0 "R0" 1
        	list(
      		list("OD"     "float" OD)  ; Inductor total width
        	list("W"      "float" WI)    
        	list("ROP" "float" 0.0) 
        	list("LOP" "float" LOP) 
        	list("MET" "int"    9)
        )) ; close dbCreateParamInst
)/*end of let*/
)/*end of pcDefinePCell*/
