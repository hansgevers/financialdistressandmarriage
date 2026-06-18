/*
Stata code supporting the paper "The Impact of Marriage or Cohabitation on Financial Distress: Evidence from SHARE 2015 to 2022 for 15 European Union Countries plus Switzerland"
Author: Hans Gevers - Junior Research Fellow at the Estonian Business School
https://orcid.org/0009-0001-0249-4142 hans.gevers@ebs.ee
*/

*Combining data from Wave 6 to Wave 9
foreach num of numlist 6(1)9{

clear all
cd "C:\Users\hansg\Documents\working\SHARE data 4\sharew`num'_rel9-0-0_ALL_datasets_stata\"
use "sharew`num'_rel9-0-0_gv_imputations.dta"
keep if implicat==1
merge 1:1 mergeid using "sharew`num'_rel9-0-0_gv_health.dta"
isid mergeid
drop _merge
merge 1:1 mergeid using "sharew`num'_rel9-0-0_gv_weights.dta"
isid mergeid
drop _merge
merge 1:1 mergeid using "sharew`num'_rel9-0-0_gv_housing.dta"
isid mergeid
drop _merge
merge 1:1 mergeid using "sharew`num'_rel9-0-0_gv_children.dta"
isid mergeid
drop _merge

if `num'==6{
	gen Qyear=2015	
}
if `num'==7{
	gen Qyear=2017	
}
if `num'==8{
	gen Qyear=2020	
}
if `num'==9{
	gen Qyear=2022	
}

label copy country cntryLab
label list cntryLab
label define cntryLab 28 "Czechia", modify
label list cntryLab
label values country cntryLab

save "C:\Users\hansg\Documents\working\SHARE data 4\W`num'_final.dta", replace


}