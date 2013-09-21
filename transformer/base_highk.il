/* 	Intellectual Properties of RFVLSI LAB, NCTU, TAIWAN. 
	Intended for Internal Use Only, All Rights Reserved, 2012 
	*DO NOT DISCLOSE*
	Author : Tao-Yi Lee */
	
strCellName="base_highk"
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(OD 	"float" 150.0)
	(W	"float" 7.0)
	(W_INC	"float" 1.5)
	(S	"float"	2.0) 
	(LOP "float"	10.0) 
	(ROP "float"	10.0) 
	(LOP_M8 "float"	10.0) 
	(ROP_M8 "float"	10.0) 
	(align_left "boolean"	t) 
	(bCons "boolean"	nil) 
)

let((pi P WW C CI A B BA BB PA PB CA CB DIV m_base_oct_half m_base_oct_half_vias),
	pi=3.141592
	P = S+W
	WW = W + W_INC
	C = ceiltogrid(W*tan(pi/8)+0.005)
	CA = roundtogrid(C/2)
	CB = C - CA
	CI = roundtogrid(WW*tan(pi/8))-C
	DIV = 2+sqrt(2)
	A = roundtogrid(OD/DIV)
	B = OD-2*A
	BA = floortogrid(B/2-0.005)
	BB = B-BA
	PA = roundtogrid(P/2)
	PB = P-PA
	m_base_oct_half = dbOpenCellViewByType(pcCellView~>lib "base_oct_half" "layout")
	m_base_oct_half_vias = dbOpenCellViewByType(pcCellView~>lib "base_oct_half_vias" "layout")

	dbCreateParamInst(pcCellView m_base_oct_half nil 0:0 "R0" 1
        list(
            list("OD"     "float" OD)
            list("W"      "float" W)
            list("ROP" "float" ROP)
            list("LOP" "float" LOP)
            list("MET"  "int" 9)
            list("bCons"    "boolean" nil)
		)
        )
	if(bCons
	then
		dbCreateParamInst(pcCellView m_base_oct_half_vias
            nil 0:0 "R0" 1
            list(
                list("OD"  "float" OD)
                list("W"    "float" W)
                list("LOP"    "float" (LOP_M8+W))
                list("ROP"    "float" ROP_M8)
                list("MET"   "int"   9))
        )
	else
		dbCreateParamInst(pcCellView m_base_oct_half_vias
            nil 0:0 "R0" 1
            list(
                list("OD"  "float" OD)
                list("W"    "float" W)
                list("LOP"    "float" LOP_M8)
                list("ROP"    "float" ROP_M8)
                list("MET"   "int"   9))
        )
	)

	if(align_left	/* high-k M8 under-pass */
	then
        dbCreateParamInst(pcCellView m_base_oct_half
			nil 0:0 "R0" 1
	        list(
                list("OD"  "float" OD)
                list("W"    "float" WW)
                list("LOP"    "float" LOP_M8)
                list("ROP"    "float" ROP_M8)
                list("bCons"    "boolean" bCons)
                list("MET"   "int"   8))
		)
	else		
		dbCreateParamInst(pcCellView m_base_oct_half
            nil 0:0 "R0" 1
            list(
                list("OD"  "float" OD+2*W_INC)
                list("W"    "float" WW)
                list("LOP"    "float" LOP_M8)
                list("ROP"    "float" ROP_M8)
                list("bCons"    "boolean" bCons)
                list("MET"   "int"   8))
        )
	)
)/*end of let*/
)/*end of pcDefinePCell*/
