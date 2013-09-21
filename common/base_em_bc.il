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


strCellName="base_em_bc";

pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W "float" 100.0) 
	(L "float" 100.0) 
	(LW "float" 5.0) 
	(boundary_ext "float" 10.0) 
	(priority "int" 10)
)
let((),
	/* EM Guard-ring */
	rfvlsiEMBoundary((-W/2- boundary_ext-LW),(-L/2-boundary_ext-LW),-300.0, (W+2*boundary_ext+2*LW),(L+2*boundary_ext+2*LW),600.0,priority)
	rfvlsiEMDie((-W/2 - boundary_ext*.9-LW),(-L/2-boundary_ext*0.9-LW), (W+boundary_ext*1.8+2*LW), (L+boundary_ext*1.8+2*LW),priority)
)) /* end of */
