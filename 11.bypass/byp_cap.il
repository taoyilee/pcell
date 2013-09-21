; rfvlsi_em_export=50 added by ywang
; rfvlsi_em_export=100 added by ywang

strLibName="RFVLSI_N65";
strCellName="byp2x";	The Cell Name is called Inductor
strViewName="layout";	This is a virtuoso layout

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(wc	"string"	"7u")	; width
	(lc	"string"	"3.2u") ; length
	(lr	"string"	"5u")	; width
	(wr	"string"	"0.5u") ; length
	(y_spacing "float" 0.9) ; rows
	(l_f "float" 0.5) ; rows
	(l_v "float" 1.0) ; rows
	(lp_space "float" 0.5); rows
	(wp_space "float" 0.5); rows
	(w_power "float" 1.0) ;power width
	(cap_finger "int" 2);finger

)
let((techfile_lib nch_m vias_m mesh_m rpps drcconerr num up dn lf rt),
	
	techfile_lib = techGetTechLibName(pcCellView~>lib)
	nch_m = dbOpenCellViewByType(techfile_lib "nmoscap_25" "layout")
	vias_m = dbOpenCellViewByType(pcCellView~>lib "vias" "layout")
	mesh_m = dbOpenCellViewByType(pcCellView~>lib "mesh_rect" "layout")
	; get the master view of nmoscap_25
    rpps = dbOpenCellViewByType(techfile_lib "rppolywo" "layout")
	
	drcconerr=0.04;
up = (y_spacing+1M*cdfParseFloatString(wr)+0.2+lp_space+w_power)  
dn = (-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power)
lf = (-0.94-wp_space-w_power) 
rt = (0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)+w_power)
    

if(rfvlsi_em_export<=50 then	
			


    for(num 1 cap_finger		
		nch_instne = dbCreateParamInst(pcCellView nch_m nil (num-1)*(0.31+1M*cdfParseFloatString(lc)):0 "MX" 1
	    list(
	    list("lr" "string" lc)
	    list("wr" "string" wc)
	    ) ; close list
	    ) ; close dbCreateParamInst
		
		dbCreateParamInst(pcCellView mesh_m nil -0.31+(num-1)*(0.31+1M*cdfParseFloatString(lc)):-0.14-1M*cdfParseFloatString(wc)+0.055 "R0" 1
                list(
                list("Length" "float" 1M*cdfParseFloatString(wc)-0.11)
                list("Width" "float"  0.62+1M*cdfParseFloatString(lc))
                list("BTM_ME" "int" 2)
                list("len_Fill" "float" l_f)
                list("len_Void" "float" l_v)
                list("TOP_ME" "int" 2)
                )
		)
		
		dbCreateParamInst(pcCellView mesh_m nil -0.31+(num-1)*(0.31+1M*cdfParseFloatString(lc)):-0.14-1M*cdfParseFloatString(wc)+0.055 "R0" 1
                list(
                list("Length" "float" 1M*cdfParseFloatString(wc)-0.11)
                list("Width" "float"  0.62+1M*cdfParseFloatString(lc))
                list("BTM_ME" "int" 1)
                list("len_Fill" "float" l_f)
                list("len_Void" "float" l_v)
                list("TOP_ME" "int" 1)
                )
		)

	);end for    
	    
		
	    rpps_instne = dbCreateParamInst(pcCellView rpps nil -0.23:y_spacing "R0" 1
        list(
        list("l" "string" lr)
        list("w" "string" wr)
        ) ; close list
        ) ; close dbCreateParamInst
	    
		/*center_cap_mesh*/
	
		
		
		/*metal2 res mesh_rect*/
		
		dbCreateParamInst(pcCellView mesh_m nil -0.2-0.23:y_spacing-0.2 "R0" 1
                list(
                list("Length" "float" 0.4+1M*cdfParseFloatString(wr))
                list("Width" "float"  1.08+1M*cdfParseFloatString(lr))
                list("BTM_ME" "int" 2)
                list("len_Fill" "float" l_f)
                list("len_Void" "float" l_v)
                list("TOP_ME" "int" 2)
                )
		)
		
		
		/*power_down*/
        dbCreateParamInst(pcCellView vias_m nil -0.94-wp_space:-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power "R0" 1
        list(
        list("Length"  "float" w_power)
        list("Width"  "float" 2*(0.94+wp_space)+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1))
        list("TOP_ME"  "int" 1)
        list("BTM_ME"  "int" 0)
            )
		); /*end of dbCreateParamInst
		
		dbCreateParamInst(pcCellView vias_m nil -0.94-wp_space:-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power "R0" 1
        list(
        list("Length"  "float" w_power)
        list("Width"  "float" 2*(0.94+wp_space)+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1))
        list("TOP_ME"  "int" 2)
        list("BTM_ME"  "int" 2)
            )
		); /*end of dbCreateParamInst
		
		/*power_top*/
        dbCreateParamInst(pcCellView vias_m nil -0.94-wp_space:y_spacing+1M*cdfParseFloatString(wr)+0.2+lp_space "R0" 1
        list(
        list("Length"  "float" w_power)
        list("Width"  "float" 2*(0.94+wp_space)+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1))
        list("TOP_ME"  "int" 1)
        list("BTM_ME"  "int" 0)
            )
		); /*end of dbCreateParamInst
		
		dbCreateParamInst(pcCellView vias_m nil -0.94-wp_space:y_spacing+1M*cdfParseFloatString(wr)+0.2+lp_space "R0" 1
        list(
        list("Length"  "float" w_power)
        list("Width"  "float" 2*(0.94+wp_space)+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1))
        list("TOP_ME"  "int" 2)
        list("BTM_ME"  "int" 2)
            )
		); /*end of dbCreateParamInst
		
		/*power_left*/
        dbCreateParamInst(pcCellView vias_m nil -0.94-wp_space-w_power:-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power "R0" 1
        list(
        list("Length"  "float" 2*(w_power+lp_space)+0.49+0.28+1M*cdfParseFloatString(wc)+y_spacing+1M*cdfParseFloatString(wr)+0.2)
        list("Width"  "float" w_power)
        list("TOP_ME"  "int" 1)
        list("BTM_ME"  "int" 0)
            )
		); /*end of dbCreateParamInst
		
		
		/*power_right*/
        dbCreateParamInst(pcCellView vias_m nil 0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1):-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power "R0" 1
        list(
        list("Length"  "float" 2*(w_power+lp_space)+0.49+0.28+1M*cdfParseFloatString(wc)+y_spacing+1M*cdfParseFloatString(wr)+0.2)
        list("Width"  "float" w_power)
        list("TOP_ME"  "int" 1)
        list("BTM_ME"  "int" 0)
            )
		); /*end of dbCreateParamInst
		
		
		
		/*cap line*/
	    dbCreateRect(pcCellView list("M1", "drawing")  list(-0.2-drcconerr:0.105-0.05 cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)+0.2+drcconerr:0.195+0.05)) 
		/*re_cap connect*/
		dbCreateRect(pcCellView list("M1", "drawing")  list(-0.2-0.05:0.105-drcconerr-0.01 -0.11+0.05:y_spacing+1M*cdfParseFloatString(wr))) 
		
		/*re_cap connect top m2*/
		dbCreateRect(pcCellView list("M2", "drawing")  list(0:-0.2 cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1):y_spacing))
	    
		/*cap_sub*/
		/*connect down*/
		dbCreateRect(pcCellView list("M1", "drawing")  list(-0.31:-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power cap_finger*(1M*cdfParseFloatString(lc)+0.31):-0.08-1M*cdfParseFloatString(wc)))
		dbCreateRect(pcCellView list("M2", "drawing")  list(-0.31:-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power cap_finger*(1M*cdfParseFloatString(lc)+0.31):-0.08-1M*cdfParseFloatString(wc)))
		
  /*connect right*/
        dbCreateRect(pcCellView list("M1", "drawing")  list(cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1):-0.14-1M*cdfParseFloatString(wc)+0.055 0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)+w_power:-0.14-0.055))
        dbCreateRect(pcCellView list("M2", "drawing")  list(cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1):dn rt-1.5:up))
        dbCreateRect(pcCellView list("M2", "drawing")  list(rt:dn rt-1.5:(up+dn)/2-3))
        dbCreateRect(pcCellView list("M2", "drawing")  list(rt:up rt-1.5:(up+dn)/2+3))

        /*connect left*/
        dbCreateRect(pcCellView list("M1", "drawing")  list(-0.94-wp_space-w_power:-0.14+0.055-1M*cdfParseFloatString(wc) 0:-0.14-0.055))
        dbCreateRect(pcCellView list("M2", "drawing")  list(lf+1.5:dn 0:up))
        dbCreateRect(pcCellView list("M2", "drawing")  list(lf:dn lf+1.5:(up+dn)/2-3))
        dbCreateRect(pcCellView list("M2", "drawing")  list(lf:up lf+1.5:(up+dn)/2+3))



        
		/*res connect via*/
		dbCreateParamInst(pcCellView vias_m nil 1M*cdfParseFloatString(lr)+0.56-0.23:y_spacing-0.2 "R0" 1
        list(
        list("Length"  "float" 1M*cdfParseFloatString(wr)+0.4)
        list("Width"  "float" 0.61)
        list("TOP_ME"  "int" 2)
        list("BTM_ME"  "int" 1)
            )
		); /*end of dbCreateParamInst
		
		/*top*/
		dbCreateRect(pcCellView list("M2", "drawing")  list(-0.43:y_spacing+1M*cdfParseFloatString(wr) -0.43+0.68+0.4+1M*cdfParseFloatString(lr):y_spacing+1M*cdfParseFloatString(wr)+0.2+lp_space+w_power))
		/*left*/
		dbCreateRect(pcCellView list("M2", "drawing")  list(-0.94-wp_space-w_power:y_spacing -0.23:y_spacing+1M*cdfParseFloatString(wr)))
		/*right*/
		;dbCreateRect(pcCellView list("M2", "drawing")  list(-0.23+1M*cdfParseFloatString(lr)+0.68+0.2:y_spacing 0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)+w_power:y_spacing+1M*cdfParseFloatString(wr)))
		dbCreateParamInst(pcCellView mesh_m nil -0.23+1M*cdfParseFloatString(lr)+0.68+0.2:y_spacing "R0" 1
                list(
                list("Length" "float" 1M*cdfParseFloatString(wr))
                list("Width" "float"  0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)-(-0.23+1M*cdfParseFloatString(lr)+0.68+0.2))
                list("BTM_ME" "int" 2)
                list("len_Fill" "float" l_f)
                list("len_Void" "float" l_v)
                list("TOP_ME" "int" 2)
                )
		)
		
else
			
  
		dbCreateRect(pcCellView list("M2", "drawing")  list(-0.94-wp_space-w_power:-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power 0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)+w_power:y_spacing+1M*cdfParseFloatString(wr)+0.2+lp_space+w_power))
		
		
		
		/*power_down*/
        dbCreateParamInst(pcCellView vias_m nil -0.94-wp_space-w_power:-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power "R0" 1
        list(
        list("Length"  "float" y_spacing+1M*cdfParseFloatString(wr)+0.2+lp_space+w_power-(-0.28-0.49-1M*cdfParseFloatString(wc)-lp_space-w_power))
        list("Width"  "float" 0.94+wp_space+cap_finger*1M*cdfParseFloatString(lc)+0.31*(cap_finger-1)+w_power-(-0.94-wp_space-w_power))
        list("TOP_ME"  "int" 1)
        list("BTM_ME"  "int" 0)
            )
		); /*end of dbCreateParamInst
		
		
) ; end If rfvlsi_em_export = 100


	
)/*end of let*/
)/*end of pcDefinePCell*/
