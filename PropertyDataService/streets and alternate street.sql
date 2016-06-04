select StreetValue, Locality, Postcode, Area as "Area (m^2)"
from 
(select Street, [Alternate Street], Locality, Postcode, Area from Splitters) spl
 unpivot 
 (StreetValue For StreetType IN (Street, [Alternate Street])

 ) as streets
 order by Locality, StreetValue
 