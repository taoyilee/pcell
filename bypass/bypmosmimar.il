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
	(rows1 "int" 1) 
	(cols1 "int" 3) 
)
let((row_sp col_sp),
	row_sp = 36.96
	col_sp = 46.36
	dbCreateParamSimpleMosaic(pcCellView 
		dbOpenCellViewByType(pcCellView~>lib "bypmosmim12x" "layout")
		"M0"  0:0 "R0" rows1 cols1 row_sp col_sp
		list(
		) ; close list
	)

)/*end of let*/
)/*end of pcDefinePCell*/
