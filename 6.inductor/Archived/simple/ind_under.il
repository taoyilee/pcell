/* Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee
*/

strLibName="RFVLSI_N65";	
strCellName="ind_under";	


pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W	"float"	4.0)	; Line width
	(S	"float"	2.0) ; Line spacing
	(TOP_ME	"int" 9)
        (BTM_ME	"int" 8)
        (NT	"int" 3)
	(INDDMY       "string" "RFVLSI")
        (INDDMYP      "string" "drawing")
        (dummy      "boolean" t)
)

let((P pi dmy),

	techfile_lib = techGetTechLibName(pcCellView~>lib)
	techFileID = techGetTechFile(ddGetObj(techfile_lib))
	
	if(BTM_ME==TOP_ME
	then
		BTM_ME = TOP_ME-1
	)
	P=W+S; Line pitch: width + space
	/*	draw bridge	*/	
	dbCreateRect(pcCellView, MetalVec(BTM_ME-1),list(-W:-W 0:P+S))	 
	dbCreateRect(pcCellView, MetalVec(TOP_ME-1),list(-(NT-1)*P:S S:P)); Draw the bridge which connects output port and the last turn
	/*      draw bridge (end)	*/
        masterv = dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
        instv = dbCreateParamInst(
	        pcCellView masterv nil -W:P+S "R0" 1
	        list(
                list("Length"  "float" W)
                list("Width"    "float" W)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME)
        ) ; close list
        ) ; close dbCreateParamInst
        instv2 = dbCreateParamInst(
        pcCellView masterv nil -W:-W "R0" 1
        list(
                list("Length"  "float" W)
                list("Width"    "float" W)
                list("TOP_ME"   "int"   TOP_ME)
                list("BTM_ME"   "int"   BTM_ME)
        ) ; close list
        ) ; close dbCreateParamInst


if(dummy
then
	dbCreateRect(pcCellView, list(INDDMY, INDDMYP),list(-(NT-1)*P:S S:P)); Draw the bridge which connects output port and the last turn
	dbCreateRect(pcCellView, list(INDDMY,INDDMYP),list(-W:-W 0:P+S))
)
)/*end of let*/
)/*end of pcDefinePCell*/

