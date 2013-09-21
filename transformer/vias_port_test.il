/*  TYLEE PCELL
    Copyright (C) 2013  Tao-Yi Lee (tylee@ieee.org)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

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