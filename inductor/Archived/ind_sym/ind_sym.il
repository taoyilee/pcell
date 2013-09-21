/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
Intended for Internal Use Only, All Rights Reserved, 2012 
*DO NOT DISCLOSE*
Author : Tao-Yi Lee */

strLibName="RFVLSI_N65";	
strCellName="ind_sym";

pcDefinePCell(
	list(ddGetObj(strLibName),strCellName, "layout"),
	(
		(OD 	"float" 180.0)	 
		(W 	"float" 8.0)	 
		(OPENING 	"float" 20.0)	 
		(LEAD 	"float" 20.0)	 
		(S 	"float" 2.01) 
		(TOP_ME "string" "9")
		(NT "int" 2)
		(L1 "string" "1n")
		(BTM_ME "string" "9")
		(dummy "boolean" t)
		(DUMMYL "string" "RFVLSI")
		(NT_N		"boolean" nil)
	)
	let((P masterL i m_hudc),
		P=W+S	; Line pitch: width + space
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy5"), 0:3, sprintf(nil "%L" W), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy6"), 0:5, sprintf(nil "%L" S), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy7"), 0:7, sprintf(nil "%L" OD), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy8"), 0:9, sprintf(nil "%L" L1), "centerCenter", "R0", "roman", 1)
		dbCreateLabel(pcCellView, list(DUMMYL, "dummy9"), 0:11, sprintf(nil "%L" NT), "centerCenter", "R0", "roman", 1)
		masterL = dbOpenCellViewByType(pcCellView~>lib "xfm_lead" "layout" );
		m_hudc = dbOpenCellViewByType(pcCellView~>lib "ind_hud_cross" "layout" )
		dbCreateLabel(pcCellView, list(DUMMYL, "drawing"), OD/2:0, "ind_sym", "centerCenter", "R0", "roman", 3)
		if(!NT_N
		then
			dbCreateLabel(pcCellView, list("text", "drawing"), 0:0, "Add NT_N Manually!", "centerCenter", "R0", "roman", 3)
		)

		if(NT>2
		then
			/* Inner L W */
			for(i 1 NT-2
				if(evenp(i)
				then
				dbCreateParamInst(pcCellView m_hudc nil 0:0 "R0" 1 list(
					list("OD" "float" OD-2*i*P)  
					list("W" "float" W) 
					list("S" "float" S) 
					list("OPENING" "float" 2*W)
					list("TOP_ME" "string" TOP_ME) 
					list("BTM_ME" "string" BTM_ME) 
					list("DUMMYL" "string" "RFVLSI") 
					list("dummy" "boolean" dummy) 
				))
				else
					dbCreateParamInst(pcCellView m_hudc nil 0:0 "MY" 1 list(
						list("OD" "float" OD-2*i*P)  
						list("W" "float" W) 
						list("S" "float" S) 
						list("OPENING" "float" 2*W)
						list("TOP_ME" "string" TOP_ME) 
						list("BTM_ME" "string" BTM_ME) 
						list("DUMMYL" "string" "RFVLSI") 
						list("dummy" "boolean" dummy) 
					))
				)
			)
		)
		if(evenp(NT)
		then
			dbCreateParamInst(pcCellView m_hudc nil 0:0 "R0" 1 list(
				list("OD" "float" OD)  
				list("W" "float" W) ; Line widh
				list("S" "float" S) 
				list("OPENING" "float" OPENING)
				list("TOP_ME" "string" TOP_ME) 
				list("BTM_ME" "string" BTM_ME) 
				list("DUMMYL" "string" "RFVLSI") 
				list("dummy" "boolean" dummy) 
			))		
			dbCreateParamInst(pcCellView m_hudc nil 0:0 "R0" 1 list(
				list("OD" "float" OD-2*(NT-1)*P)  
				list("W" "float" W) 
				list("S" "float" S) 
				list("OPENING" "float" 0)
				list("TOP_ME" "string" TOP_ME) 
				list("BTM_ME" "string" BTM_ME) 
				list("DUMMYL" "string" "RFVLSI") 
				list("dummy" "boolean" dummy) 
				list("under" "boolean" nil) 
			))
		else
			dbCreateParamInst(pcCellView
				dbOpenCellViewByType(pcCellView~>lib "xfm_halfud" "layout" );
				nil -OD/2:0 "R0" 1
				list(
				list("OD" "float" OD)  
				list("W" "float" W) 
				list("S" "float" S)
				list("LOP" "float" 0.0)
				list("ROP" "float" OPENING)
				list("TOP_ME" "string" TOP_ME)
				list("BTM_ME" "string" BTM_ME)
				list("DUMMYL" "string" "RFVLSI")
				list("dummy" "boolean" dummy)
				list("via_to_next" "boolean" nil)
				list("via_diag" "boolean" nil)
			)) ; close dbCreateParamInst
		)
		/**** LEAD UNDER PASS ****/ 
		dbCreateParamInst(pcCellView masterL nil OD/2:OPENING "R0" 1
			list(
			list("L" "float" LEAD)  
			list("W" "float" W) 
			list("WD" "float" 1.0) 
			list("PINTXT" "string" "P1") 
			list("PINP" "string" "dummy1")
			list("TOP_ME" "string" TOP_ME)
			list("BTM_ME" "string" BTM_ME)
			list("DUMMYL" "string" DUMMYL)
			list("dummy" "boolean" dummy)
		))
		/**** LEAD UNDER PASS ****/ 
		dbCreateParamInst(pcCellView masterL nil OD/2:-OPENING-W "R0" 1
			list(
			list("L" "float" LEAD)  
			list("W" "float" W) 
			list("WD" "float" 1.0) 
			list("PINTXT" "string" "N1")
			list("PINP" "string" "dummy1") 
			list("TOP_ME" "string" TOP_ME)
			list("BTM_ME" "string" BTM_ME)
			list("DUMMYL" "string" DUMMYL)
			list("dummy" "boolean" dummy)
		))
	)
)