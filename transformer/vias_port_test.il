strCellName="vias_port_test"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(Length 	"float" 150.0)
	(Width 	"float" 4.0)	
)
let((P pi dmy),

	masterVias = dbOpenCellViewByType(pcCellView~>lib "vias" "layout");
	dbCreateParamInst(pcCellView masterVias nil 0:0 "R0" 1
		list(
		list("Width" 	"float" Width)	 
		list("Length" 	"float" 100.0)
		list("TOP_ME" 	"int" 9) 	
		list("BTM_ME" 	"int" 9)	 
	) 1)
	
	dbCreateParamInst(pcCellView masterVias nil 0:0 "R0" 1
		list(
		list("Width" 	"float" Width)	 
		list("Length" 	"float" 100.0)
		list("TOP_ME" 	"int" 3) 	
		list("BTM_ME" 	"int" 1)	 
	) 1)

	dbCreateParamInst(pcCellView masterVias nil 0:100.0 "R0" 1
		list(
		list("Width" 	"float" 100.0)	 
		list("Length" 	"float" Width)
		list("TOP_ME" 	"int" 9) 	
		list("BTM_ME" 	"int" 9)	 
	) 1)
	
	dbCreateParamInst(pcCellView masterVias nil 0:100.0 "R0" 1
		list(
		list("Width" 	"float" 100.0)	 
		list("Length" 	"float" Width)
		list("TOP_ME" 	"int" 3) 	
		list("BTM_ME" 	"int" 1)	 
	) 1)
	dbCreateParamInst(pcCellView masterVias nil 100.0:0 "MY" 1
		list(
		list("Width" 	"float" Width)	 
		list("Length" 	"float" 100.0)
		list("TOP_ME" 	"int" 9) 	
		list("BTM_ME" 	"int" 9)	 
	) 1)
	
	dbCreateParamInst(pcCellView masterVias nil 100.0:0 "MY" 1
		list(
		list("Width" 	"float" Width)	 
		list("Length" 	"float" 100.0)
		list("TOP_ME" 	"int" 3) 	
		list("BTM_ME" 	"int" 1)	 
	) 1)
	
	dbCreateParamInst(pcCellView masterVias nil 20.0:0 "R0" 1
		list(
		list("Width" 	"float" 60.0)	 
		list("Length" 	"float" 10.0)
		list("TOP_ME" 	"int" 9) 	
		list("BTM_ME" 	"int" 1)	 
	) 1)	
	rfvlsiEMVport("port1",0,0,Width,0,0,8,1);
	rfvlsiEMVport("port2",100.0-Width,0,100.0,0,0,8,1);
	
	rfvlsiEMBoundary(-10.0,-10.0,-300.0,120,120,600.0,1)
	rfvlsiEMDie(-10.0,-10.0,120,120,1)
	)/*end of let*/
)/*end of pcDefinePCell*/