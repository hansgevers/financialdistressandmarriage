/*
Stata code supporting the paper "The Impact of Marriage or Cohabitation on Financial Distress: Evidence from SHARE 2015 to 2022 for 15 European Union Countries plus Switzerland"
Author: Hans Gevers - Junior Research Fellow at the Estonian Business School
https://orcid.org/0009-0001-0249-4142 hans.gevers@ebs.ee
*/

*Combining data from Wave 6 to Wave 9
clear all
cd "C:\Users\hansg\Documents\working\SHARE data 4"
use "W6_final.dta"
merge 1:1 mergeid using "W6_weights.dta", keep(match)
drop _merge
save "W6_final.dta", replace

clear all
cd "C:\Users\hansg\Documents\working\SHARE data 4"
use "W7_final.dta"
merge 1:1 mergeid using "W6_weights.dta", keep(match)
drop _merge
save "W7_final.dta", replace

clear all
cd "C:\Users\hansg\Documents\working\SHARE data 4"
use "W8_final.dta"
merge 1:1 mergeid using "W6_weights.dta", keep(match)
drop _merge
save "W8_final.dta", replace

clear all
cd "C:\Users\hansg\Documents\working\SHARE data 4"
use "W9_final.dta"
merge 1:1 mergeid using "W6_weights.dta", keep(match)
drop _merge
save "W9_final.dta", replace

clear all
cd "C:\Users\hansg\Documents\working\SHARE data 4"
use "W6_final.dta"
append using "W7_final.dta"
append using "W8_final.dta"
append using "W9_final.dta"

save "dataset.dta", replace