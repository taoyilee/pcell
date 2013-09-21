strLibName="RFVLSI_N65";	My Library name is my student id
strCellName="vdiag";	The Cell Name is called Inductor
strViewName="layout";	This is a virtuoso layout
pcDefinePCell(
list(ddGetObj(strLibName),strCellName, "layout"),
(
	(W	"float"	3.0)	; Line width
	(VIA "int" 5)
)

let((pitch num enc_prime),
	pitch = ViaWidthVec(VIA-1) + ViaSpacingVec(VIA-1)
	num = floor((W-2*ViaEncVec(VIA-1)+ViaSpacingVec(VIA-1))/pitch)
	enc_prime = roundtogrid((W - num*pitch+ViaSpacingVec(VIA-1))/2)

if(num > 0
then
	for(i 0 num-1
		dbCreateRect(pcCellView ViaVec(VIA-1)
		list(enc_prime + i*pitch:enc_prime + i*pitch 
			enc_prime + ViaWidthVec(VIA-1) + i*pitch:enc_prime + ViaWidthVec(VIA-1) + i*pitch))
	))
)/*end of let*/
)/*end of pcDefinePCell*/
