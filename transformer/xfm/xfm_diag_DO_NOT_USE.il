/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWOAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strLibName="RFVLSI_N65";  /*Assign your library name to variable strLibName*/
strCellName="xfm_diag";	  /*Assign your cell name to variable strCellName*/

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(WI 	"float" 8.0)	; Line width
	(WO 	"float" 8.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(MET	"int"	9) ; Line spacing
	(dummy   "boolean"	t) ; Line spacing
)
let((pi P C K C2 OO OOCHD OOC OOCH_A OOCH_B OOCHD_A OOCHD_B),
	pi=3.141592
	P=S+WO
	C=roundtogrid(WO*tan(pi/8))
	K=roundtogrid((P+C)/2)
	C2=roundtogrid(C/sqrt(2))
	OO = 2*WO+WI+2*S
	OOC = 2*WO+WI+2*S-2*C2
	OOCH_A = roundtogrid(OOC/2)
	OOCH_B = OOC - OOCH_A
	if(2*S+WI <=2.0*sqrt(2)
	then
		OOCHD_A = OOCH_A + roundtogrid(2*sqrt(2.0)- WI)
		OOCHD_B = OOCH_B + roundtogrid(2*sqrt(2.0)- WI)
	else
		OOCHD_A = OOCH_A
		OOCHD_B = OOCH_B
	)
		dbCreatePolygon(pcCellView, MetalVec(MET-1),
			list(
				0:-OOCH_A+C 0:-OOCHD_A 
				WO:-OOCHD_A WO:-OOCH_A
				OO:OOCH_B-C OO:OOCHD_B
			    OO-WO:OOCHD_B OO-WO:OOCH_B 

			)
			); end of dbCreate
;;
	if(dummy
	then
		dbCreatePolygon(pcCellView, list("RFVLSI","drawing"),
		list(
				0:-OOCH_A	WO:-OOCH_A
				OO:OOCH_B-C OO:OOCH_B
				OO-WO:OOCH_B 0:-OOCH_A+C
		))
	)
))
