#!/bin/bash

awk -F: '{print $2 "  " $4}' esportistes

awk -F: 'BEGIN{suma=0} \
{edat=$4;
suma=suma+edat; 
print edat} \
END{print "La mitja es: ", suma/NR;}' esportistes

echo -n "Introdueix el nom del Club a modificar:"
read clubvell
echo -n "Introdueix el nom nou del Club:"
read clubnou

awk -F: 'BEGIN{print "Inici del procediment"; OFS=":"} \
	{if($6 == cv ){ $6=cn}
	 print $0 > "aux"}
	 END { Print "Operacio realitzada"}' \
   cv="$clubvell" cn="$clubnou" esportistes

rm esportistes
mv aux esportistes
