/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
 *DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strLibName="RFVLSI_N65"
strCellName="xfm"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
				 (OD 	"float" 180.0)	; Inductor total width
				 (WI 	"float" 4.0)	
				 (WO 	"float" 2.0)	
				 (ROP 	"float" 20.0)	
				 (LOP 	"float" 20.0)	
				 (LEAD 	"float" 20.0)	
				 (LEADDYI 	"float" 0.0)	
				 (LEADDYO 	"float" 0.0)	
				 (S 	"float" 2.0) 
				 (TOP_ME "string" "9")
				 (BTM_ME "string" "9")
				 (dummy "boolean" t)
				 (DUMMYL "string" "RFVLSI")
				 (xfm_str "string" "xfm")
)
let((PI PO master masterL),
								PI=WI+S	; Line pitch: width + space
								PO=WO+S	; Line pitch: width + space
								master = dbOpenCellViewByType(pcCellView~>lib "xfm_lct_t" "layout" );
								masterL = dbOpenCellViewByType(pcCellView~>lib "xfm_lead" "layout" );
								dbCreateLabel(pcCellView, list(DUMMYL, "dummy6"), OD/2:3, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 2)
								dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), OD/2:7, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 2)
								dbCreateLabel(pcCellView, list(DUMMYL, "dummy8"), OD/2:11, sprintf(nil "%L" WI), "centerCenter", "R0", "roman", 2)
								dbCreateLabel(pcCellView, list(DUMMYL, "dummy9"), OD/2:15, sprintf(nil "%L" WO), "centerCenter", "R0", "roman", 2)
								dbCreateParamInst(pcCellView master nil 0:0 "R0" 1  
										list(
												list("OD" 	"float" 	OD) ; Inductor total width
												list("WI"	"float" 	WI)	
												list("WO"	"float" 	WO)	
												list("S"	"float"		S) 
												list("CW"	"float"		WI+2*S) 
												list("LOP"	"float" LOP) 
												list("ROP" 	"float"	ROP)
												list("LEADDYI"   "float" LEADDYI) 
												list("LEADDYO"   "float" LEADDYO) 
												list("TOP_ME" "string" TOP_ME)
												list("BTM_ME" "string" BTM_ME)
												list("text" "string" xfm_str)
											))


								dbCreateParamInst(pcCellView masterL nil -S:LOP+LEADDYI+2*S "MY" 1
												list(
														list("L"   "float" LEAD)  ; Inductor total width
														list("W"   "float" WI)  
														list("WD"   "float" 1.0)  
														list("PINTXT" "string" "P1")
														list("PINP" "string"  "dummy1")
														list("TOP_ME" "string" TOP_ME)
														list("BTM_ME" "string" BTM_ME)
														list("DUMMYL" "string" DUMMYL)
														list("dummy" "boolean" dummy)
													))

								dbCreateParamInst(pcCellView masterL nil -S:-LOP-WI-2*S+LEADDYI "MY" 1
												list(
														list("L"   "float" LEAD)  ; Inductor total width
														list("W"   "float" WI)  
														list("WD"   "float" 1.0)  
														list("PINTXT" "string" "N1")
														list("PINP" "string"  "dummy1")   
														list("TOP_ME" "string" TOP_ME)
														list("BTM_ME" "string" BTM_ME)
														list("DUMMYL" "string" DUMMYL)
														list("dummy" "boolean" dummy)
													))

								; /**** LEAD UNDER PASS ****/  
								masterUD= dbOpenCellViewByType(pcCellView~>lib "under" "layout")
								lead_param = list(
												list("W"   "float" WI)  
												list("WX"   "float" WI)  
												list("S"   "float" 2*S+WO)  
												list("NT"   "int" 1)  
												list("TOP_ME" "string" TOP_ME)
												list("BTM_ME" "string" BTM_ME)
												list("dummy" "boolean" t)
												list("vias" "boolean" t)
												list("top" "boolean" t)
												) ; close list
								dbCreateParamInst(pcCellView masterUD nil WO+S:LOP+2*S "R90" 1 lead_param)
								dbCreateParamInst(pcCellView masterUD nil WO+S:-LOP-2*S-WI "R90" 1 lead_param)

								instL3=dbCreateParamInst(pcCellView masterL nil OD:ROP+LEADDYO "R0" 1
												list(
														list("L"   "float" LEAD)  ; Inductor total width
														list("W"   "float" WO)  
														list("WD"   "float" 1.0)  
														list("PINTXT" "string" "P2") 
														list("PINP" "string"  "dummy1")   
														list("TOP_ME" "string" TOP_ME)
														list("BTM_ME" "string" BTM_ME)
														list("DUMMYL" "string" DUMMYL)
														list("dummy" "boolean" dummy)
													))
								instL4=dbCreateParamInst(pcCellView masterL nil OD:-ROP-WO+LEADDYO "R0" 1  
												list(
														list("L"   "float" LEAD)  ; Inductor total width
														list("W"   "float" WO)  
														list("WD"   "float" 1.0)  
														list("PINTXT" "string" "N2") 
														list("PINP" "string"  "dummy1")  
														list("TOP_ME" "string" TOP_ME)
														list("BTM_ME" "string" BTM_ME)
														list("DUMMYL" "string" DUMMYL)
														list("dummy" "boolean" dummy)
													))

								MhalfUD = dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
								inst=dbCreateParamInst(pcCellView MhalfUD nil WO+S:0 "R0" 1
												list(
														list("OD"   "float" OD-2*(WO+S)) ; Inductor total width
														list("W"   "float" WI)  
														list("S"   "float" S) 
														list("LOP" "float" LOP+2*S)
														list("ROP" "float"  0.0) 
														list("TOP_ME" "string"  TOP_ME) 
														list("BTM_ME" "string"  BTM_ME) 
														list("DUMMYL" "string" "RFVLSI") 
														list("dummy" "boolean"  dummy) 
													)) ; close dbCreateParamInst
))
