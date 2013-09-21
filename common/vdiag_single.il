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

strCellName="vdiag_single"
strLibName="RFVLSI_N65"

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(n "int"   6)
	(MET	  "int" 8)
)
let((Pitch VS),
			VS = ceiltogrid(ViaSpacingVec(MET-1)/sqrt(2))+0.005
			Pitch=ViaWidthVec(MET-1)+VS
			for(i 0 n-1
				dbCreateRect(pcCellView ViaVec(MET-1) 
					list(
						Pitch*i:Pitch*i
						Pitch*i+ViaWidthVec(MET-1):Pitch*i+ViaWidthVec(MET-1)
					))
			)

)/*end of let*/
)/*end of pcDefinePCell*/

                                                              
